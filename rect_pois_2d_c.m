clear all;
close all;
% spatstat: An R Package for Analyzing Spatial Point Patterns
% http://stackoverflow.com/questions/27936167/poisson-point-process-in-matlab
% http://connor-johnson.com/2014/02/25/spatial-point-processes/
% http://www.mathworks.com/matlabcentral/fileexchange/2493-simulation-of-stochastic-processes/content/stproc/poisson2d.m

density = 0.004;
length_x = 600;
length_y = 600;

lambda=density*(2*length_x)*(2*length_y);

npoints = poissrnd(lambda)
Data = rand(2, npoints); % uniform distribution

plot(Data(1,:)*2*length_x-length_x, Data(2,:)*2*length_y-length_y, '.');
npoints/(2*length_x*2*length_y)

fid = fopen('2d_data.csv','w');

for ii = 1:npoints
fprintf(fid, '%f, %f,\n', Data(1,ii)*2*length_x-length_x, Data(2,ii)*2*length_y-length_y);
endfor

status = fclose(fid); 