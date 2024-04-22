function result=Gauss_quadrature_for_dK_integral_trial_test_left(j,n,result1_2,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,trial_basis_index,trial_derivative_degree,test_basis_index,test_derivative_degree)


Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    dK=function_dK1(result1_2,vertices,T_basis,Gauss_point_local_1D(i),j,n,0);
    result=result+(1/2)*Gauss_coefficient_local_1D(i)*dK*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,trial_basis_index,trial_derivative_degree)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end    

