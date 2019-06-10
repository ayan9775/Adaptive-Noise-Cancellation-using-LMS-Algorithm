clc; clear all;

%Clean Speech
[x,Fs] = audioread('sp02.wav');

%Corrupted Speech Signal
[d,Fc] = audioread('sp02_airport_sn0.wav');
x = x(:);
d = d(:);

N = length(x);
%Length of Filter
M = 16;

%initializing the filter coefficents
w = zeros(M,1); xin = zeros(M,1); e = zeros(N,1); 


%LMS Algorithm
for i=1:N
    
    %Creating the X(k) input vector
    xin = [x(i); xin(1:end-1)];
    
    temp1 = d(i) - w'*xin;
    e(i) = temp1;
    mu = 0.2772;
    
    %Updating the filter coefficients vector
    temp2 = w + 2*mu*e(i)*xin;
    w = temp2;
    
end

%Estimated Clean speech
e1 = d - e;

%Noise present in the output clean speech
noi = e1 - x;

%=================================================================

%     The range of mu should be chosen between the range

%     0 < mu < 1/{2*(10*M*Px)} ; where Px = rxx(0)/N ;
%     Where M = length of the filter, and N = length of the 
%     input signal      -> Estimated upperbound of mu = 0.496

%=================================================================

%-------------Plotting the Signals--------------------------------
n = 1:length(x);

subplot(4,1,1)
plot(n,d)
xlabel('iterations')
ylabel('Corrupted Speech')
axis([0 22000 -0.4 0.4]);

subplot(4,1,2)
plot(n,e,'g')
xlabel('iterations')
ylabel('Estimated Noise')
axis([0 22000 -0.4 0.4]);

subplot(4,1,3)
plot(n,e1,'r')
xlabel('iterations')
ylabel('Denoised Speech')
axis([0 22000 -0.4 0.4]);

subplot(4,1,4)
plot(n,x)
xlabel('iterations')
ylabel('Original Speech')
axis([0 22000 -0.4 0.4]);

disp('The estimated SNR is,')
digitsOld = digits(8);
vpa(snr(e1,noi))


