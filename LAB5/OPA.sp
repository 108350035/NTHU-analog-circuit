*LAB5
.protect
.lib "/home/IC/Synopsys/hspice/cic018.l" tt
.temp 25
.unprotect
.option post runlvl=6 captable
.param cm=0.65
.param length=1u
MB x Vb VSS VSS n_18 w=8.6*length l=length m=1
M1 M1D Vip x VSS n_18 w=4.3*length l=length m=1
M2 M2D Vin x VSS n_18 w=4.3*length l=length m=1
M3 M3D Vcasn M1D VSS n_18 w=4.3*length l=length m=1
M4 out Vcasn M2D VSS n_18 w=4.3*length l=length m=1
M5 M3D Vcasp M5S VDD p_18 w=4.3*length l=length m=1
M6 out Vcasp M6S VDD p_18 w=4.3*length l=length m=1
M7 M5S M3D VDD VDD p_18 w=4.3*length l=length m=1
M8 M6S M3D VDD VDD p_18 w=4.3*length l=length m=1
CL out VSS 2p

V1 VDD GND 1.8
V2 VSS GND 0
V3 Vb VSS 0.5
Vcm Vcm VSS cm
Vdiff Vdiff 0 ac 1
Ep Vip Vcm Vdiff VSS 0.5
En Vin Vcm Vdiff VSS -0.5
V4 Vcasn VSS 0.85
V5 Vcasp VSS 0.7

.op
.probe V(out)
.tf V(out) Vdiff
.ac dec 10 1 100G
.pz V(out) Vdiff
.probe vdb(out) vp(out)
.meas ac dcgain_in_db max Vdb(out)
.meas ac BW when Vdb(out)='dcgain_in_db-3'
.end


