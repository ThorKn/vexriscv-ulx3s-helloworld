all: verilog bitstream elffile flash openocd

verilog:
	cd vexriscv ; $(MAKE)

bitstream:
	cd ulx3s ; $(MAKE)

elffile:
	cd hello_world ; $(MAKE)

flash:
	ujprog ulx3s/Murax.bit

openocd:
	cd vexriscv ; openocd-vexriscv -f tf2323h_openocd.cfg

gdb:
	cd hello_world/build ; riscv64-unknown-elf-gdb -tui -ex 'set remotetimeout 10' -ex 'target remote :3333' -ex load -ex 'break main' hello_world.elf	
