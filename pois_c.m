% Set the lambda. 
%Introduction to Probability, Statistics, and Random Processes
clear all;
close all;
lambda = 0.013;
r = 4000;
tol = 0;
ii=1;
% Generate the exponential random variables.
% upper
while tol < r/2
x1(ii) = exprnd(1/lambda,1,1);
tol = sum(x1);
ii=ii+1;
end
x1(end)=[];
N = length(x1);

% Generate the exponential random variables.
% lower
tol = 0;
ii=1;
while tol < r/2
x2(ii) = exprnd(1/lambda,1,1);
tol = sum(x2);
ii=ii+1;
end
x2(end)=[];
M = length(x2);

% Find the R_i.
R = zeros(1,N + M);
% upper
for ii = 1:N
R(ii) = sum(x1(1:ii));
end
% lower
for ii = 1:M
R(N+ii) = -sum(x2(1:ii));
end

R(end)=[];

Data_x = zeros(2, length(R));
Data_y = zeros(2, length(R));
for ii = 1:length(R)
Data_x(1,:) = R(:);
Data_y(2,:) = R(:);
endfor

length(R)/r

fid(1) = fopen('1d_data_x.csv','w');
fid(2) = fopen('1d_data_y.csv','w');
for ii = 1:length(R)
fprintf(fid(1), '%f, %f,\n', Data_x(1,ii), Data_x(2,ii));
fprintf(fid(2), '%f, %f,\n', Data_y(1,ii), Data_y(2,ii));
endfor
status(1) = fclose(fid(1)); 
status(2) = fclose(fid(2)); 