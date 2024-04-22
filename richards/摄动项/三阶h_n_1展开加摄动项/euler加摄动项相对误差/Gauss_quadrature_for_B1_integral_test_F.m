function result=Gauss_quadrature_for_B1_integral_test_F(j,n,result1_1,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,...
    test_basis_index,test_derivative_degree)

Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    %”“∂ÀœÓ=edh_n - K(h_n)dh_n
	e = function_e;
    dglobal_solver = global_function_F(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n,1);  
    K=function_K_F(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n,0);
    %dK=function_dK(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    %global_solver=global_function(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    result=result+Gauss_coefficient_local_1D(i)*(e-K)*dglobal_solver*local_basis_1D_reference(Gauss_point_local_1D(i),...
        vertices,test_basis_index,test_derivative_degree);
end   