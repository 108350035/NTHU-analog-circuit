*LAB4
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
.param x = 0
Eopamp out GND GND in1 x
Vin in GND 0 ac 1
R1 in in1 1k
R2 in1 out 10k


.op
.dc x 500 550 1
.probe dc V(out) deriv("V(out)")
.tf V(out) Vin

.end


