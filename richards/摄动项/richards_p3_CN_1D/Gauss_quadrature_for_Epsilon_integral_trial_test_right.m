function result=Gauss_quadrature_for_Epsilon_integral_trial_test_right(Epsilon,j,n,result1_1,result1_3,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,test_basis_index,test_derivative_degree)


Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
%     K=function_K1(result1_2,vertices,T_basis,Gauss_point_local_1D(i),j,n,0);
    global_solver_n=global_function1(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j-1/2,n,1);
    global_solver_n_1=global_function1(result1_3,vertices,T_basis,Gauss_point_local_1D(i),j-1/2,n,1);

     result=result+Gauss_coefficient_local_1D(i)*Epsilon*(2*global_solver_n-global_solver_n_1)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end    

