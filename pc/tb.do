vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom pc2.vhd tb_pc2.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /data_in
add wave -radix binary  /data
add wave -radix dec  /load
add wave -radix dec  /up
add wave -radix dec  /reset
add wave -radix binary  /clk

#Simula até um 500ns
run 900ns

wave zoomfull
write wave wave.ps