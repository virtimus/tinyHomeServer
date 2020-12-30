#!/bin/bash

echo "[bootstrap] Installing iverilog ..."
sudo apt install iverilog

echo "[bootstrap] Downloading verilog files ..."
uRef=https://raw.githubusercontent.com/virtimus/tinyHomeServer/master/features-dev/makaronLab/verilog-course/lecture3
cd /src && mkdir -p /src/verilog-course/lecture3 && cd /src/verilog-course/lecture3 && wget $uRef/example.v && wget $uRef/testbench.v
cd /src/verilog-course/lecture3