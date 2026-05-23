*LAB3
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
.param x = 3
.param length = 2u
MN out in GND GND n_18 w="5.3*length" l=length m=1
MP out Vb VDD VDD p_18 w="5.3*length" l=length m=1
V1 VDD GND 1.8
V2 Vb GND 1.2
Vin in GND 0.38

.op
*.dc Vin 0 1.8 0.01 sweep x 1 8 0.01
.probe dc V(out) deriv("V(out)")
.tf V(out) Vin

.end


