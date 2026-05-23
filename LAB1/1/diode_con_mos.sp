*LAB1
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
.param length=0.18u


MN VDN VDN GND GND n_18 w="3*length" l="length" m=1
MP VDP VDP VDD VDD p_18 w="3*length" l="length" m=1
I0 VDD VDN 30u
I1 VDP GND 30u
V1 VDD GND 1.8


.op
.dc length 0.18u 10u 0.01u
.probe dc n_Vth=par("LV9(MN)")
+ n_Vdsat=par("LV10(MN)") 
+ n_gm=par("LX7(MN)") 
+ n_gds=par("LX8(MN)")  
+ n_id=par("LX4(MN)") 
+ n_cg=par("LX18(MN)") 
+ n_ro=par("1/LX8(MN)") 
+ n_gain=par("LX7(MN)/LX8(MN)")
+ n_power_eff=par("LX7(MN)/LX4(MN)")
+ n_speed=par("LX7(MN)/LX18(MN)")
+ p_Vth=par("LV9(MP)") 
+ p_Vdsat=par("LV10(MP)") 
+ p_gm=par("LX7(MP)") 
+ p_gds=par("LX8(MP)")  
+ p_id=par("LX4(MP)") 
+ p_cg=par("LX18(MP)") 
+ p_ro=par("1/LX8(MP)") 
+ p_gain=par("LX7(MP)/LX8(MP)")
+ p_power_eff=par("LX7(MP)/LX4(MP)")
+ p_speed=par("LX7(MP)/LX18(MP)")

.alter
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" ff
.unprotect

.alter
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" ss
.unprotect
.end

