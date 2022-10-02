transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/student/Desktop/BCD_adder/Gates.vhdl}
vcom -93 -work work {C:/Users/student/Desktop/BCD_adder/DUT.vhdl}
vcom -93 -work work {C:/Users/student/Desktop/BCD_adder/BCD_adder.vhd}

vcom -93 -work work {C:/Users/student/Desktop/BCD_adder/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
