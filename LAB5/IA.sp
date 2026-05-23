*LAB5
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
.include 'OPA.cir'    
X1 VSS VDD Vip Vm out OPA

VDD VDD GND 1.8
VSS VSS GND 0
VBS VBS GND 0.66
Vac Vac GND 0 ac 1
Ep Vip VBS Vac VSS 0
En Vin VBS Vac VSS 1
R1 Vin Vm 1x
R2 Vm out 10x
CL out VSS 2p

.op
.probe V(out)
.tf V(out) Vac
.ac dec 10 1 100G
.pz V(out) Vac
.probe vdb(out) vp(out)
.meas ac dcgain_in_db max Vdb(out)
.meas ac BW when Vdb(out)='dcgain_in_db-3'
.end



