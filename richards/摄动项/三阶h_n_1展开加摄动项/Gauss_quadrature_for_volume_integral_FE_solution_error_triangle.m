function r=Gauss_quadrature_for_volume_integral_FE_solution_error_triangle(uh_local,accurate_function_local,vertices,Gauss_coefficient_reference_1D,Gauss_point_reference_1D)


Gpn=length(Gauss_coefficient_reference_1D);

r=0;
    lower_bound=min(vertices(1),vertices(2));
    upper_bound=max(vertices(1),vertices(2));
    
%每一个单元上的高斯节点值和高斯系数
    [Gauss_coefficient_local_1D,Gauss_point_local_1D]=generate_Gauss_local_1D(Gauss_coefficient_reference_1D,Gauss_point_reference_1D,lower_bound,upper_bound);
for i=1:Gpn
    r=r+Gauss_coefficient_local_1D(i)*(FE_solution_triangle(Gauss_point_local_1D(i),accurate_function_local,vertices)...
        -FE_solution_triangle(Gauss_point_local_1D(i),uh_local,vertices))^2;
end