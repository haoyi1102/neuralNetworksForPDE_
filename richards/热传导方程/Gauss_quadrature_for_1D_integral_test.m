function result=Gauss_quadrature_for_1D_integral_test(j,n,result1_1,t_partition,vertices,T_basis,Gauss_coefficient_local_1D,...
    Gauss_point_local_1D,test_basis_index,test_derivative_degree)

Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    %”“∂ÀœÓ=(1/t)h_n+f(z,t)
    global_solver=global_function(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    g_function=function_g(Gauss_point_local_1D(i),(j-1)*t_partition);
    
    result=result+Gauss_coefficient_local_1D(i)*((1/t_partition)*global_solver+g_function)*local_basis_1D_reference(Gauss_point_local_1D(i),...
        vertices,test_basis_index,test_derivative_degree);
end   