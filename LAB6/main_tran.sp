*LAB6
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 27
.unprotect
.option 
+ post
+ runlvl = 6
+ captable
.include 'two_stage_op.cir'

X1 VDD Vip Vin Vfb Vop Von TWO_ST
X2 VDD Vx Vfb CMFB
R1 Vop Vx 0.5g
R2 Von Vx 0.5g

VDD VDD GND 1.8

VCM VCM GND 0.8
Vdiff Vdiff GND sin 0 0.05m 10k 0.5n
Ep Vip Vcm Vdiff GND 0.5
En Vin Vcm Vdiff GND -0.5
.ic V(Vop) = 0 V(Von) = 0
.tran 10u 1m

.meas ac dcgain_in_db max Vdb(Vop,Von)
.meas ac UGB when Vdb(Vop, Von) = "0"
.meas ac PM find"Vp(Vop, Von) + 180" when Vdb(Vop, Von) = "0"
.end
