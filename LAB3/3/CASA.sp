*LAB3
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
.param length = 2u
RD VDD out 100k
MN0 x in GND GND n_18 w="5.3*length" l=length m=1
MP0 x Vb1 VDD VDD p_18 w="5.3*length" l=length m=1
MN1 out Vb2 x GND n_18 w="7.5*length" l=length m=1
V1 VDD GND 1.8
V2 Vb1 GND 1.2
V3 Vb2 GND 1.02
I0 x GND 10uA
Vin in GND 0.382 ac 1

.op
*.dc Vin 0 1.8 0.01 
.ac dec 10 1 100G
.pz V(out) Vin
.meas ac dcgain_in_db max Vdb(out)
.meas ac BW when Vdb(out)='dcgain_in_db-3'
.meas ac UGB when Vdb(out)=0
.probe dc V(out) deriv("V(out)") i(MN)
.probe vdb(out) vp(out)
.tf V(out) Vin

.end

