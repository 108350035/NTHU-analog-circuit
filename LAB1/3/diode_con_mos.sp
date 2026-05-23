*LAB1
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" ss
.temp 25
.unprotect
.option post runlvl=6 captable
*.param ratio=1 get 2.6
.param x = 0

MN0 VDD G S GND n_18 w="2u*2.6" l=2u m=1
MN1 VDD G S S n_18 w="2u*2.6" l=2u m=1
V1 VDD GND 1.8
V2 G GND 'x + 0.7'
V3 S GND 'x'

.op
.dc x 0 1 0.001
.probe dc n0_id=par("LX4(MN0)")
+ n0_Vth=par("LV9(MN0)")
+ n0_gm=par("LX7(MN0)")
+ n1_id=par("LX4(MN1)")
+ n1_Vth=par("LV9(MN1)")
+ n1_gm=par("LX7(MN1)")
