set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN U51 [get_ports clk]
create_clock -period 10 [get_ports clk]

set_property IOSTANDARD LVCMOS18 [get_ports button]
set_property PACKAGE_PIN AU38 [get_ports button]

set_property IOSTANDARD LVCMOS18 [get_ports rst]
set_property PACKAGE_PIN AP40 [get_ports rst]