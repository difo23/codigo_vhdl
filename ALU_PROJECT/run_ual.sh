ghdl -a mux_16.vhd && ghdl -a sum_16.vhd && ghdl -a xor_16.vhd && 
ghdl -a alu.vhd && ghdl -e alu &&
ghdl -r alu --vcd=alu.vcd && gtkwave alu.vcd
