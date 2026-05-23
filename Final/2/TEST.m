clear all;
close all;
clc
N = 6; %resolution
Vcm = 0.81; 
fs = 20000; %sampling rate

Weight=[32 16 8 4 2 1]
sampling_points=1024;
data=csvread('final_enob_1.98.csv',2,1);
Digital_code = zeros(sampling_points,N);
%Convert analog signal to digital code
for i= 1:sampling_points
    for j = 1:N
        if data(i,j)>Vcm
            Digital_code(i,j)=1;
        end
    end
end
Daq = zeros(sampling_points,1);
for k=1:sampling_points
    for i=1:N
        Daq(k) = Daq(k) + (2^(N-i)).*Digital_code(k,i);
    end
end

n=0:1023;
Daq_1 = sin(2*pi*n*511/1024)+1;
Daq_1 = rot90(Daq_1);
plot(Daq_1);
plot(Daq);

[ENOB ,SNDR, SFDR]=FreqA(Daq,fs)

% using FFT 
%any parameter using two side spectrum to calculate
function [ENOB ,SNDR, SFDR]=FreqA(Daq,fs)
N=size(Daq,1); 
if N==1
    N=size(Daq,2); 
end
y=(abs(fft(Daq))/N);    %power spectrum
y(1)=0;                 %cancel DC value
figure;
x=(0:((N)/2)).*(fs/N);
min=-150;
y=y/max(y);
ydb=(mag2db(y(1:N/2+1)));
for k=1:1:length(ydb)
    if ydb(k,1)<min
        y(k,1)=10^(min/20);
    end
end
%plot(x,mag2db(y(1:N/2+1)));
ydb=(mag2db(y(1:N/2+1)));
ydb=ydb-max(ydb);
plot(x,ydb);
[Signal, index]=max(y);
SignalPower=Signal^2*2;     %mulitply 2 because two side convert to one sinde
fin=x(index);
% =====================%TNoisePower=Noise power + Distortion power;
TNoise=y(1:N/2+1);
TNoise(index)=0;
TNoisePower=sum(TNoise.^2)*2;
% ===================
[sfdr, index]=max(TNoise);


SFDR=mag2db(Signal/sfdr);

SNDR=10*log10(SignalPower/TNoisePower);
ENOB=(SNDR-1.76)/6.02;

text(max(x)-max(x)/2,-30,sprintf('fs=%d MHz\nSNDR=%2.3f dB\nSFDR=%2.3f dB \nENOB=%2.3f bits',fs/1e6,SNDR,SFDR,ENOB),'FontSize',12);
ylabel('Power Density (dBFS/bin)');
xlabel('Frequency (Hz)');
end



