*FINAL
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" ss
.temp 27
.unprotect
.option 
+ post
+ runlvl = 6
+ captable
.include 'band_gap.cir'

Xbgr VDD GND Vref bgr
VDD VDD GND pwl(0 0 10u 0 100u 2)
VSS VSS GND 0

.op
.tran 0.01u 110u sweep temp -40 125 1
.alter
.lib "/home/IC/Synopsys/hspice/cic018.l" tt

.alter
.lib "/home/IC/Synopsys/hspice/cic018.l" ff
.end
