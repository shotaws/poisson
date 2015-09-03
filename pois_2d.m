% Set the lambda.
% Computational Statistics Handbook with MATLAB
clear all;
close all;
lambda = 0.013;
r = 600;
tol = 0;
ii=1;
% Generate the exponential random variables.
while tol < pi*r^2
x(ii) = exprnd(1/lambda,1,1);
tol = sum(x);
ii=ii+1
end
x(end)=[];
N = length(x);
% Get the coordinates for the angles.
th = 2*pi*rand(1,N); % uniform distribution
R = zeros(1,N);
% Find the R_i.
for ii = 1:N
R(ii) = sqrt(sum(x(1:ii))/pi); % (tol < pi*r^2) -> unit circle
end
[Xc,Yc]=pol2cart(th,R);
length(Xc)/(pi*r^2)

Data = zeros(2,length(Xc));
for ii = 1:length(Xc)
Data(1,:) = Xc(:);
Data(2,:) = Yc(:);
endfor

fid = fopen('2d_data.csv','w');

%fprintf(fid, '%f, %f,\n', Xc, Yc);
for ii = 1:length(Xc)
fprintf(fid, '%f, %f,\n', Data(1,ii), Data(2,ii));
endfor
status = fclose(fid); 