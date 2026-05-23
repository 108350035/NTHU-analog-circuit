*FINAL
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" ff
.temp 27
.unprotect
.option 
+ post
+ runlvl = 6
+ captable
.include 'band_gap.cir'

Q1 VSS VSS E1 VSS PNP_V100X100 m=1
Q2 VSS VSS E2 VSS PNP_V100X100 m=12
Q3 VSS VSS E3 VSS PNP_V100X100 m=1
Xgm VB VDD gm_start_up
Xop D2 E1 VB Vo VDD TWO_OP
M0 E1 VG VDD VDD p_18 w=40u l=5u m=1
M1 D2 VG VDD VDD p_18 w=40u l=5u m=1
M2 Vref VG VDD VDD p_18 w=40u l=5u m=1
R1 D2 E2 40k
R2 Vref E3 412k
Lac Vo VG 1E+100
Cac Vac VG 1E+100
Vac Vac GND 0 ac 1
VDD VDD GND 1.8
VSS VSS GND 0

.op
.ac dec 10 1 1g
.pz V(Vo) Vac
.probe ac Vdb(Vo) Vp(Vo)
.alter
.lib "/home/IC/Synopsys/hspice/cic018.l" tt

.alter
.lib "/home/IC/Synopsys/hspice/cic018.l" ss
.end
