function result=Gauss_quadrature_for_K_integral_trial_test(j,n,result1_1,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,trial_basis_index,trial_derivative_degree,test_basis_index,test_derivative_degree)


Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    %��˵ڶ���=K��h_n)*(dh_n+1)
    K=function_K(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
     result=result+Gauss_coefficient_local_1D(i)*K*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,trial_basis_index,trial_derivative_degree)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end    

