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
X2 VDD Vx Vo CMFB
R1 Vop Vx 0.5g
R2 Von Vx 0.5g

VDD VDD GND 1.8

VCM VCM GND 0.8
Ep Vip VCM GND GND 0.5
En Vin VCM GND GND -0.5
Lac Vfb Vo 1E+100
Cac Vfb Vac 1E+100
Vac Vac GND 0 ac 1


.op
.ac dec 10 1 1g
.pz V(Vx) Vac
.probe ac Vdb(Vx) Vp(Vx)
.meas AC PM find"Vp(Vx)" when Vdb(Vx) = "0"

.end
