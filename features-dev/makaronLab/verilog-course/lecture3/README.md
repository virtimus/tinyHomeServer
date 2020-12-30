

#install iverilog (icarus-verilog):
sudo apt install iverilog

#or install ikarus from source:
#@refs:https://iverilog.fandom.com/wiki/Installation_Guide#Installation_From_Source
cd /src && git clone https://github.com/steveicarus/iverilog
cd /src ...


#@refs:https://youtu.be/wiNDn19GpRU?t=2002 
uRef=https://raw.githubusercontent.com/virtimus/tinyHomeServer/master/features-dev/makaronLab/verilog-course/lecture3
cd /src && mkdir -p verilog-course/lecture3 && cd verilog-course/lecture3 && wget $uRef/example.v && wget $uRef/testbench.v
cd /src/verilog-course/lecture3 && iverilog -o mysim example.v testbench.v
cd /src/verilog-course/lecture3 && vvp mysim
