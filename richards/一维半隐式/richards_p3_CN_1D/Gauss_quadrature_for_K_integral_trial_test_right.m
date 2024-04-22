function result=Gauss_quadrature_for_K_integral_trial_test_right(j,n,result1_1,result1_2,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,test_basis_index,test_derivative_degree)


Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    K=function_K1(result1_2,vertices,T_basis,Gauss_point_local_1D(i),j,n,0);
    global_solver=global_function1(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j-1/2,n,test_derivative_degree);
     result=result+(1/2)*Gauss_coefficient_local_1D(i)*K*global_solver*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end    

