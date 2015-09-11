# Ethernet Traffic Analyzer

Simple tool to analyze, shape, and generate ethernet traffic. <br/>
Features include:
* Monitor traffic type distribution
* Throttle selected tcp connections
* Improve throughput with smarter drop policies ([RED](https://en.wikipedia.org/wiki/Random_early_detection))
* Customize network for latency vs. throughput
* Raise alerts during suspicious port connections
* Visualize bandwidth usage

## Setup

Who knows yet.

## Related resources:

http://www.flukenetworks.com/enterprise-network/network-monitoring/Tap-Solutions

## Architecture

### Ethernet input goes to several stages of parsing.

1. Use the built in ethernet port for input and use an [ETHERNET to USB](http://www.amazon.com/Belkin-B2B048-1000Mbps-Gigabit-Ethernet/dp/B00BE67N3Q) adapter for the output
2. Analytic parsing: In-depth packet analysis.
3. Filter parsing: Parsing just enough to filter appropriate packets so as to avoid latency.

###Analytics: ([From parsed ethernet frame](https://en.wikipedia.org/wiki/Ethernet_frame))

1. Source
2. Determine traffic categories
3. Bandwidth usage
4. Latency
5. Recognize High fragmentation

### Filter:

1. Elastic vs inelastic traffic.
2. Blocking certain sources.
3. Throttling certain sources. (Actual TCP drop vs Report Dup ACK)
4. Expediting certain sources. (Throttle other streams vs fake prefetch with pre-emptive ACKs)

### Audio:

1. Alarms for suspicious behavior
2. Notification settings
3. Alarms for recurring network failures
4. Simple piezo-speakers

### Video:

1. VGA controller
2. Lists of traffic streams with basic stats
3. Real-time feed of bandwidth usage
4. Real-time feed of ping

### Controls:

1. Keyboard for arrow keys and numpad.
2. Selected a traffic stream from the display.

### Output:

1. Traffic rules that apply to all traffic.
2. Buffering rules. (Reduce or extend buffer bloat)
3. Smarter drop policies. ([RED](https://en.wikipedia.org/wiki/Random_early_detection))
