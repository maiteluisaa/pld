vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom ir.vhd tb_ir.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /data
add wave -radix binary  /immediate
add wave -radix binary  /mem_addr
add wave -radix binary  /opcode
add wave -radix dec  /en
add wave -radix dec  /reset
add wave -radix binary  /clk

#Simula até um 500ns
run 900ns

wave zoomfull
write wave wave.ps