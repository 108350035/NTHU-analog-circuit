*LAB4
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
Eopamp out GND in out 1000
Vin in GND 0.1
RL out GND 1M

.op
.dc Vin 0 5 0.01 
.probe dc V(out) deriv("V(out)")
.tf V(out) Vin

.end


