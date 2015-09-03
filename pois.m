% Set the lambda. 
%Introduction to Probability, Statistics, and Random Processes
clear all;
close all;
lambda = 0.013;
r = 4000;
tol = 0;
ii=1;
% Generate the exponential random variables.
while tol < r
x(ii) = exprnd(1/lambda,1,1);
tol = sum(x);
ii=ii+1;
end
x(end)=[];
N = length(x);

R = zeros(1,N);
% Find the R_i.
for ii = 1:N
R(ii) = sum(x(1:ii));
end

R(end)=[];
R;
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