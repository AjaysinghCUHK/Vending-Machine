set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 [get_ports clk]

set_property PACKAGE_PIN P16 [get_ports {cancel}];
#NET BTNC          LOC = P16  | IOSTANDARD=LVCMOS18;  # "BTNC"
set_property PACKAGE_PIN R16 [get_ports {one_in}];
#NET BTND          LOC = R16  | IOSTANDARD=LVCMOS18;  # "BTND"
set_property PACKAGE_PIN N15 [get_ports {two_in}];
#NET BTNL          LOC = N15  | IOSTANDARD=LVCMOS18;  # "BTNL"
set_property PACKAGE_PIN R18 [get_ports {five_in}];
#NET BTNR          LOC = R18  | IOSTANDARD=LVCMOS18;  # "BTNR"
set_property PACKAGE_PIN T18 [get_ports {reset}]
#NET BTNU          LOC = T18  | IOSTANDARD=LVCMOS18;  # "BTNU"
set_property IOSTANDARD LVCMOS18 [get_ports cancel]
set_property IOSTANDARD LVCMOS18 [get_ports one_in]
set_property IOSTANDARD LVCMOS18 [get_ports two_in]
set_property IOSTANDARD LVCMOS18 [get_ports five_in]
set_property IOSTANDARD LVCMOS18 [get_ports cancel]
set_property IOSTANDARD LVCMOS18 [get_ports reset]

set_property PACKAGE_PIN F22 [get_ports {collect_in[0]}];
#NET SW0           LOC = F22  | IOSTANDARD=LVCMOS18;  # "SW0"
set_property PACKAGE_PIN G22 [get_ports {collect_in[1]}];
#NET SW1           LOC = G22  | IOSTANDARD=LVCMOS18;  # "SW1"
set_property IOSTANDARD LVCMOS25 [get_ports collect_in[0]]
set_property IOSTANDARD LVCMOS25 [get_ports collect_in[1]]

set_property PACKAGE_PIN T22 [get_ports {one_out}];
#NET LD0           LOC = T22  | IOSTANDARD=LVCMOS33;  # "LD0"
set_property PACKAGE_PIN T21 [get_ports {two_out}];
#NET LD1           LOC = T21  | IOSTANDARD=LVCMOS33;  # "LD1"
set_property PACKAGE_PIN U22 [get_ports {five_out}];
#NET LD2           LOC = U22  | IOSTANDARD=LVCMOS33;  # "LD2"
set_property PACKAGE_PIN U21 [get_ports {one_out2}];
#NET LD3           LOC = U21  | IOSTANDARD=LVCMOS33;  # "LD3"
set_property PACKAGE_PIN V22 [get_ports {two_out2}];
#NET LD4           LOC = V22  | IOSTANDARD=LVCMOS33;  # "LD4"
set_property PACKAGE_PIN W22 [get_ports {five_out2}];
#NET LD5           LOC = W22  | IOSTANDARD=LVCMOS33;  # "LD5"
set_property PACKAGE_PIN U19 [get_ports {dispense[0]}];
#NET LD6           LOC = U19  | IOSTANDARD=LVCMOS33;  # "LD6"
set_property PACKAGE_PIN U14 [get_ports {dispense[1]}];
#NET LD7           LOC = U14  | IOSTANDARD=LVCMOS33;  # "LD7"
set_property IOSTANDARD LVCMOS33 [get_ports one_out]
set_property IOSTANDARD LVCMOS33 [get_ports two_out]
set_property IOSTANDARD LVCMOS33 [get_ports five_out]
set_property IOSTANDARD LVCMOS33 [get_ports one_out2]
set_property IOSTANDARD LVCMOS33 [get_ports two_out2]
set_property IOSTANDARD LVCMOS33 [get_ports five_out2]
set_property IOSTANDARD LVCMOS33 [get_ports dispense[0]]
set_property IOSTANDARD LVCMOS33 [get_ports dispense[1]]

set_property IOSTANDARD LVCMOS33 [get_ports ssd]
set_property IOSTANDARD LVCMOS33 [get_ports ssdcat]
set_property PACKAGE_PIN Y11 [get_ports {ssd[6]}]
set_property PACKAGE_PIN AA11 [get_ports {ssd[5]}]
set_property PACKAGE_PIN Y10 [get_ports {ssd[4]}]
set_property PACKAGE_PIN AA9 [get_ports {ssd[3]}]
set_property PACKAGE_PIN W12 [get_ports {ssd[2]}]
set_property PACKAGE_PIN W11 [get_ports {ssd[1]}]
set_property PACKAGE_PIN V10 [get_ports {ssd[0]}]
set_property PACKAGE_PIN W8 [get_ports ssdcat]
