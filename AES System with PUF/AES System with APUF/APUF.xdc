set_property IOSTANDARD LVCMOS25 [get_ports clk]
set_property IOSTANDARD LVCMOS25 [get_ports reset]
set_property PACKAGE_PIN C19 [get_ports clk]
set_property PACKAGE_PIN F19 [get_ports reset]

set_property CLOCK_DEDICATED_ROUTE false [get_nets {clk_IBUF}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clk_IBUF}]
