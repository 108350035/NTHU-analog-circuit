*LAB2
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
*.param x=1
R0 VDD out 50k
MN out in GND GND n_18 w="0.81*2u" l=2u m=1
V1 VDD GND 1.8
Vin in GND 0.8

.op
.dc Vin 0 1.8 0.01 
.probe dc V(out) V(in)
.meas dc OUT_DERIV DERIV V(out) WHEN V(in) = 0.8
.meas dc ID  FIND I(MN) WHEN V(in) = 0.8
.tf V(out) Vin

.end


