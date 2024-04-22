function [Gauss_coefficient_local_1D,Gauss_point_local_1D]=generate_Gauss_local_1D(Gauss_coefficient_reference_1D,Gauss_point_reference_1D,lower_bound,upper_bound)
%Generate the Gauss coefficients and Gauss points on an arbitrary interval [lower_bound,upper_bound] by using affine tranformation.
%通过使用仿射转换在任意区间 [lower_bound，upper_bound] 上生成高斯系数和高斯点。
%Gauss_coefficient_local_1D,Gauss_point_local_1D:the Gauss coefficients and Gauss points on an arbitrary interval.Gauss_coefficient_local_1D，Gauss_point_local_1D：
%任意区间上的高斯系数和高斯点。
%Gauss_coefficient_reference,Gauss_point_reference: the Gauss coefficients and Gauss points on the reference interval [-1,1].
%Gauss_coefficient_reference，Gauss_point_reference：参考区间 [-1，1] 上的高斯系数和高斯点。

Gauss_coefficient_local_1D=(upper_bound-lower_bound)*Gauss_coefficient_reference_1D/2;
Gauss_point_local_1D=(upper_bound-lower_bound)*Gauss_point_reference_1D/2+(upper_bound+lower_bound)/2;