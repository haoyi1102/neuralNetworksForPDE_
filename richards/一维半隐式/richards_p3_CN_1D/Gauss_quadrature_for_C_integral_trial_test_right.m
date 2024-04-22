function result=Gauss_quadrature_for_C_integral_trial_test_right(j,n,result1_1,result1_2,T,t_partition,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,test_basis_index,test_derivative_degree)


Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    C=function_C1(result1_2,vertices,T_basis,Gauss_point_local_1D(i),j,n,0);
    global_solver=global_function1(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j-1/2,n,0);
    g=function_g(Gauss_point_local_1D(i),(j-1/2)*t_partition,T);
     result=result+Gauss_coefficient_local_1D(i)*((1/t_partition)*C*global_solver+g)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end    

