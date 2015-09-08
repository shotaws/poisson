clear all;
close all;
% spatstat: An R Package for Analyzing Spatial Point Patterns
% http://stackoverflow.com/questions/27936167/poisson-point-process-in-matlab
% http://connor-johnson.com/2014/02/25/spatial-point-processes/
% http://www.mathworks.com/matlabcentral/fileexchange/2493-simulation-of-stochastic-processes/content/stproc/poisson2d.m
% Stochastic Processes for Spatial Econometrics
% Stochastic Geometry, Spatial Statistics and Random Fields: Asymptotic Methods

density = 0.013;
length = 5000;

lambda=density*length;

npoints = poissrnd(lambda)
pproc = rand(1, npoints); % uniform distribution

npoints/length

Data_x = zeros(2, npoints);
Data_y = zeros(2, npoints);
for ii = 1:npoints
Data_x(1,:) = pproc(:);
Data_y(2,:) = pproc(:);
endfor

% http://jp.mathworks.com/help/matlab/math/floating-point-numbers-within-specific-range.html
r_range = [min(Data_x(1,:)*length - length/2) max(Data_x(1,:)*length - length/2)]
r_range = [min(Data_y(2,:)*length  - length/2) max(Data_y(2,:)*length  - length/2)]

fid(1) = fopen('1d_data_x.csv','w');
fid(2) = fopen('1d_data_y.csv','w');
for ii = 1:npoints
fprintf(fid(1), '%f, %f,\n', Data_x(1,ii)*length - length/2, Data_x(2,ii));
fprintf(fid(2), '%f, %f,\n', Data_y(1,ii), Data_y(2,ii)*length  - length/2);
endfor
status(1) = fclose(fid(1)); 
status(2) = fclose(fid(2)); 