clear all;
close all;
% spatstat: An R Package for Analyzing Spatial Point Patterns
% http://stackoverflow.com/questions/27936167/poisson-point-process-in-matlab
% http://connor-johnson.com/2014/02/25/spatial-point-processes/
% http://www.mathworks.com/matlabcentral/fileexchange/2493-simulation-of-stochastic-processes/content/stproc/poisson2d.m
% Non-Uniform Random Variate Generation

density = 0.04;
length_x = 500;
length_y = 500;

lambda=density*length_x*length_y;

npoints = poissrnd(lambda)
Data = rand(2, npoints); % uniform distribution

plot(Data(1,:)*length_x, Data(2,:)*length_y, '.');
npoints/(length_x*length_y)

fid = fopen('2d_data.csv','w');

for ii = 1:npoints
fprintf(fid, '%f, %f,\n', Data(1,ii)*length_x, Data(2,ii)*length_y);
endfor

status = fclose(fid); 