*LAB2
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
.param length=1u
.param x = 5
RS out GND 50k
MN VDD in out GND n_18 w="1.6*0.9u" l=0.9u m=1
V1 VDD GND 1.8
Vin in GND 1.6

.op
*.dc length 0.5u 2u 0.01u sweep x 0.5 4 0.01
*.dc x 0.25 6 0.01 sweep y 1k 90k 0.5k
.dc Vin 0 1.8 0.01
.probe dc V(out) deriv("V(out)")
.tf V(out) Vin

.end


