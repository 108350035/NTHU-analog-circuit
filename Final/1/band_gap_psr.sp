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
VDD VDD GND 1.8 ac 1
VSS VSS GND 0

.op
.dc temp -40 125 1
.ac dec 10 1 1g sweep temp -40 125 1
.probe Vdb(Vref) Vp(Vref)
.alter
.lib "/home/IC/Synopsys/hspice/cic018.l" tt

.alter
.lib "/home/IC/Synopsys/hspice/cic018.l" ff
.end
