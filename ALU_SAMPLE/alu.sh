ghdl -a lou.vhd && ghdl -a aru.vhd && ghdl -a muxVector.vhd && ghdl -a aluComponente.vhd && ghdl -e aluComponente &&
ghdl -r aluComponente --vcd=aluComponente.vcd && gtkwave aluComponente.vcd
