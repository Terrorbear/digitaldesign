#include "hls_stream.h"
#include "ap_axi_sdata.h"

#define HEADER_OCTS (6 + 6 + 4 + 2)
#define MAC_OCTS 6

using namespace hls;

typedef ap_axiu<32, 1, 1, 1> pkt;

int admissable(char* mac_dst, char* mac_src, char* qtag, char* ethertype);

void filter (stream<pkt>& InStream, stream<pkt>& OutStream) {
#pragma HLS INTERFACE axis port=OutStream
#pragma HLS INTERFACE axis port=InStream

	static char headers[HEADER_OCTS];
	static int npkt = 0;
	pkt packet;
	static stream<pkt> hold;
	static stream<pkt> last;

	char* mac_dest;
	char* mac_src;
	char* qtag;
	char* ethertype;

	// Get take in the packet
	InStream >> packet;
	hold << packet;

	// Update
	if(npkt < HEADER_OCTS / 4){
		char* in_octets = (char *)&packet.data;
		for(int i = 0; i < 4; i++){
			headers[npkt * 4 + i] = in_octets[3 - i];
			// 3 - i because I think the first incoming octet should be at index 0
			// And i think it fills in the first octet at the MSBs of the data
		}
	}
	npkt++;

	// Decide to transmit or not
	if(packet.last){

		mac_dest = headers;
		mac_src = headers + 6;
		qtag = headers + 12;
		if(qtag[0] == (char)0x81 && qtag[1] == (char)0x00){
			ethertype = headers + 16;
		} else {
			ethertype = qtag;
			qtag = NULL;
		}

		if(admissable(mac_dest, mac_src, qtag, ethertype)){
			for(;npkt > 0; npkt--){
				hold >> packet;
				OutStream << packet;
			}
		} else {
			for(;npkt > 0; npkt--){
				hold >> packet;
			}
		}

	}
/* Source Code */
}

int dst_allow(char* mac_dst){
	// Could make it only accept packets with our mac address, but whatever.
	return 1;
}

int src_allow(char* mac_src){
	if(mac_src == NULL){
		return 0;
	}

	// Heavy hitter algorithm with a threshold
	static char old_addr[MAC_OCTS];
	static int seen = 0;
	int threshold = 64;

	for(int i = 0; i < MAC_OCTS; i++){
		if(old_addr[i] != mac_src[i]){
			goto mac_dst_new;
		}
	}
	seen++;
	return seen < threshold;

  mac_dst_new:
  	if(seen == 0){
  		for(int i = 0; i < MAC_OCTS; i++){
  			old_addr[i] = mac_src[i];
  		}
  	} else {
  		seen--;
  	}
  	return 1;
}

int qtag_allow(char *qtag){
	if(qtag == NULL){
		return 1;
	}

	int skb_max = 1024; // Or whatever it really is
	int skb_len = 512; // This should actually be reported from PS
	char PCP = qtag[2] & 0xE0; // I think it's in little Endian
	char DEI = qtag[2] & 0x10;
	int VLAN_id = ((int)(qtag[2] & 0xF) << 8) | (int)(qtag[3]);

	// Super duper simple ones based off of socket kernel buffer length

	if(skb_max >> 1 < skb_len && DEI > 0){
		return 0;
	}

	if(skb_max - (skb_max >> 2) << skb_len && PCP < 3){
		return 0;
	}

	return 1;
}

int ethertype_allow(char *ethertype){
	if(ethertype == NULL){
		return 0;
	}

	int etype = ((int)(ethertype[0]) << 8) | (int)(ethertype[1]);
	if (etype == 0x800) return 1; // IPv4
	if (etype == 0x806) return 1; // ARP
	return 0;
}

int admissable(char* mac_dst, char *mac_src, char *qtag, char *ethertype){
	return (dst_allow(mac_dst) &&
			src_allow(mac_src) &&
			qtag_allow(qtag) &&
			ethertype_allow(ethertype));
}
