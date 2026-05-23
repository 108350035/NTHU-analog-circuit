*LAB1
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
.param length=0.18u


MN VDD VGN GND GND n_18 w="3*length" l="length" m=1
MP GND VGP VDD VDD p_18 w="3*length" l="length" m=1
V1 VDD GND 1.8
*V2 VGN GND 1
V3 VGP GND 1

.op
*.dc V2 0 1.8 0.01 sweep length 1.8u 10u 1.8u
.dc V3 1.8 0 0.01 sweep length 18u 10u 1.8u
*.probe dc n_id=par("LX4(MN)")
.probe dc p_id=par("LX4(MP)") 

.alter
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" ff
.unprotect

.alter
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" ss
.unprotect
.end

