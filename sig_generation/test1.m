clear all;
L = 1e2;                %sample length
Fs = 1000;              % sampling rate
X = randn(1,L);         % awgn
Y = fft(X);             % frequency domain of awgn
P2 = abs(Y/L);          % sideband of frequency domain representation 
P1 = P2(1:L/2+1);       % another sideband of fourier domain representation 
P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;     % frequency values for the plot
% plot(f,P1) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% 
fl=70;                  % tunable parameter
c=100;                  % another tunable parameter
f=1:1:L;                % frequency component for the plot 
fu=fl+c;
hf=1i*fu^2*f/(fl+1i*f)*(fu+1i*f);   % frequency domain representation of the transfer function 
Yf = hf.*Y;                         % multiplication in the frequency domain will 
                                    % correspond to convolution in the time
                                    % domain 
Yout = ifft(Yf);                    % inverse fourier transform for the output signal to convert 
                                    % it into time domain representation 
plot(abs(Yout))              