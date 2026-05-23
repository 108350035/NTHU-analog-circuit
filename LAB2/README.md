# 1

將L設定成2u，spec的電流限制為11.11uA~30uA，取中間值得電阻約50k。
電阻固定，掃描符合spec之W/L，得0.81。
DC分析下得 Rout=47.5511k
TF分析下德Av=-4.0649 Rout=47.5511k
ro=1/gds=970.779k
電流為19.9757uA 手算Vout=0.801215V 實際為0.802V
Av=-gm(ro//RD)=-4.0655

# 2
將RD固定為50k，L設定成2u，spec的電流限制為10uA~30uA。
掃描符合spec之W/L以及VG偏壓，得Vt=0.381V W/L=5.65 Vb=0.68V ID約18uA。
DC分析下得 Rin=4.4206k Rout=45.6044k dVo/dVi=11.6
TF分析下德Av=11.3107 
ro=1/gds=518.7k
電流為17.8969uA 手算Rin=4.4204k Rout=45.60401k Vout=0.905155V  實際為0.902V
Av=11.3111
