# 3D_histogram
A matlab implementation that can easily return an 3D histogram of an input image in RGB color space.

input image:
![alt tag](https://github.com/odegeasslbc/3D_histogram/blob/master/img.jpg?raw=true)

output result:
![alt tag](https://github.com/odegeasslbc/3D_histogram/blob/master/3d%20hist.jpg?raw=true)

##Usage

result_table = get_3D_histogram( inputimage, X, Y, Z);
% X is the nibs in X axis, so does Y and Z;
%for example, I want an output of [100,110,120], X = 100, Y = 110 AND Z = 120.
