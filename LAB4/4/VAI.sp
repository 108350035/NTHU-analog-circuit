*LAB4
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
Eadd vo1 GND GND v1 1000
Eint vo2 GND GND v2 1000
Eint2 out GND GND v3 1000
R1 x v1 4k
R2 out v1 2k
R3 v1 vo1 12k
R4 vo1 v2 50
C1 v2 vo2 1m
R5 vo2 v3 100
C2 out v3 1m
Vx x  GND pulse 0 1 5 1n 1n 10
.op
.tran 1m 20
.probe V(out)

.end


