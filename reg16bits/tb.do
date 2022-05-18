vlib work

#compila projeto: todos os aquivo. Ordem � importante
vcom reg16bits.vhd tb_reg16bits.vhd

#Simula (work � o diretorio, testbench � o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas espec�ficas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /clk
add wave -radix binary  /clear
add wave -radix binary  /w_flag
add wave -radix dec  /data_in
add wave -radix dec  /reg_out

#Simula at� um 500ns
run 500ns

wave zoomfull
write wave wave.ps