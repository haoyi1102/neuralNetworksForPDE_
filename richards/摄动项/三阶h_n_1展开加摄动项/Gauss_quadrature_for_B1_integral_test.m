function result=Gauss_quadrature_for_B1_integral_test(j,n,result1_1,result1_2,result1_3,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,...
    test_basis_index,test_derivative_degree)

Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    %”“∂ÀœÓ=e(3dh_n-3dh_n_1+dh_n_2) - K(h^_n_1)dh^_n_1
    h_n_1 = 3*result1_1-3*result1_2+result1_3;
	e = function_e;
    dglobal_solver_n = dglobal_function(h_n_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);  
    K=function_K(h_n_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    result=result+Gauss_coefficient_local_1D(i)*(e*dglobal_solver_n-K*dglobal_solver_n)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end   