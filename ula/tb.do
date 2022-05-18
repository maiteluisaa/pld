vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom ula.vhd tb_ula.vhd

#Simula (work diretorio, testbench o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas especificas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix dec  /a
add wave -radix dec  /b
add wave -radix dec  /result_lsb
add wave -radix dec  /result_msb
add wave -radix binary  /aluop
add wave -radix dec /dut/boolc
add wave -radix dec /dut/boole

#Simula até 900ns
run 900ns

wave zoomfull
write wave wave.ps
