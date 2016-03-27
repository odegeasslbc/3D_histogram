function [ resultTable ] = get_3D_histogram( image, X, Y, Z )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
height = size(image,1);
width = size(image,2);

resultTable = zeros(X,Y,Z);

R_table = [];
G_table = [];
B_table = [];
size_table = [];
color_table = [];
%get the number of pixels for each RGB color
%for example resultTable(0,0,255) = 10 means 
%there are 10 pixels in blue
for h = 1:height;
    for w = 1:width;     
        r = round(int16(image(h,w,1))*X/255);
        g = round(int16(image(h,w,2))*Y/255);
        b = round(int16(image(h,w,3))*Z/255);
        if r==0;
            r = 1;
        end;
        if g==0;
            g = 1;
        end;
        if b==0;
            b = 1;
        end;  
        resultTable(r,g,b) = resultTable(r,g,b) + 1;
    end;
end;

largest = max(resultTable(:,:,:));
offset = largest/5;

i= 0;
for r = 1:X;
    for g = 1:Y;
        for b = 1:Z;
            if resultTable(r,g,b) > 0
                R_table = [R_table,r];
                G_table = [G_table,g];
                B_table = [B_table,b];
           
                size_table = [size_table, resultTable(r,g,b) ];
                color_table = [color_table; r/X,g/Y,b/Z];
                
                i = 1 +i;
                p = i / (X*Y*Z);
                disp(p);
            end;
        end;
    end;
end

scatter3(R_table, G_table, B_table, size_table, color_table);
axis([0 X 0 Y 0 Z]);
xlabel('Red');  
ylabel('Green');  
zlabel('Blue');
rotate3d on 

title('3-D histogram');
end

