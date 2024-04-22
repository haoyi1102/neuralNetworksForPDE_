function [Gauss_coefficient_local_rectangular,Gauss_point_local_rectangular]=generate_Gauss_local_rectangular(Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,vertices_rectangular)
%Xiaoming He, 04/14/2009.
%Generate the Gauss coefficients and Gauss points on the local triangle by using affine tranformation
%Some details are in my 2 dimensional bilinear IFE notes(part 8)
%Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle: the Gauss coefficients and Gauss points on the reference triangle
%vertices_triangle: the coordinates of the vertices of the local triangle 
%Gauss_coefficient_local_triangle,Gauss_point_local_triangle:the Gauss coefficients and Gauss points on the local triangle.

x1=vertices_rectangular(1,1);
y1=vertices_rectangular(2,1);
x2=vertices_rectangular(1,2);
y2=vertices_rectangular(2,2);
x3=vertices_rectangular(1,3);
y3=vertices_rectangular(2,3);
x4=vertices_rectangular(1,4);
y4=vertices_rectangular(2,4);
Jacobi=(x2-x1)*(y4-y1)/4;
Gauss_coefficient_local_rectangular=Gauss_coefficient_reference_rectangular*Jacobi;
Gauss_point_local_rectangular(:,1)=(x1+x2)/2+(x2-x1)*Gauss_point_reference_rectangular(:,1)/2;
Gauss_point_local_rectangular(:,2)=(y1+y4)/2+(y4-y1)*Gauss_point_reference_rectangular(:,2)/2;