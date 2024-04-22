function result=Gauss_quadrature_for_1D_integral_test_E(j,n,result1_1,T,t_partition,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,test_basis_index,test_derivative_degree)

Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    %”“∂ÀœÓ=(1/t)C(h_n)h_n+g(z,t)
    C=function_C_E(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    global_solver=global_function_E(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    g_function=function_g(Gauss_point_local_1D(i),(j-1)*t_partition,T);
    
    result=result+Gauss_coefficient_local_1D(i)*((1/t_partition)*C*global_solver+g_function)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end   