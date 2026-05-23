*LAB2
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
*.param x=10
R0 VDD out 50k
MN out Vb in GND n_18 w="5.65*2u" l=2u m=1
V1 VDD GND 1.8
V2 Vb GND 0.68
Vin in GND 0.16

.op
*.dc Vin 0 1.8 0.01
.probe dc V(out) deriv("V(out)")
.tf V(out) Vin

.end


