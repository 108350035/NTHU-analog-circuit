*LAB6
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" ff
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
Vdiff Vdiff GND 0 ac 1
Ep Vip Vcm Vdiff GND 0.5
En Vin Vcm Vdiff GND -0.5

.op
.dc VCM 0 1 0.1
.tf V(Vop, Von) Vdiff
.ac dec 10 1 1g sweep VCM 0 1 0.1
.pz V(Vop, Von) Vdiff
.probe vdb(Vop,Von) Vp(Vop,Von)
.meas ac dcgain_in_db max Vdb(Vop,Von)
.meas ac UGB when Vdb(Vop, Von) = "0"
.meas ac PM find"Vp(Vop, Von) + 180" when Vdb(Vop, Von) = "0"
.end
