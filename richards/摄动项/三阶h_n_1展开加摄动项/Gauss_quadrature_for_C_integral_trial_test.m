function result=Gauss_quadrature_for_C_integral_trial_test(j,n,result1_1,result1_2,result1_3,t_partition,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,trial_basis_index,trial_derivative_degree,test_basis_index,test_derivative_degree)

%数值积分
Gpn=length(Gauss_coefficient_local_1D);

%左端第一项11*C(h^n_1)/(6t)
result=0;
for i=1:Gpn
    h_n_1=3*result1_1-3*result1_2+result1_3;
    C=function_C(h_n_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
     result=result+11/6*Gauss_coefficient_local_1D(i)*C/t_partition*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,trial_basis_index,trial_derivative_degree)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end    

