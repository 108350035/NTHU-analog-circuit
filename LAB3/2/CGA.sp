*LAB3
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
.param x = 3
.param length = 2u
RD VDD out 100k
MN out Vb in GND n_18 w="7.5*length" l=length m=1
V1 VDD GND 1.8
V2 Vb GND 1.02
Vin in GND 0.5

.op
*.dc V2 0.9 1.2 0.01 sweep x 1 10 0.01
.probe dc V(out) deriv("V(out)") i(MN)
.tf V(out) Vin

.end


