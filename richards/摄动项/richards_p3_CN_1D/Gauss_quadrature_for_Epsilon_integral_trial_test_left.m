function result=Gauss_quadrature_for_Epsilon_integral_trial_test_left(Epsilon,vertices,Gauss_coefficient_local_1D,Gauss_point_local_1D,...
    trial_basis_index,trial_derivative_degree,test_basis_index,test_derivative_degree)


Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    
%     K=function_K1(result1_2,vertices,T_basis,Gauss_point_local_1D(i),j,n,0);
     result=result+Gauss_coefficient_local_1D(i)*Epsilon*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,trial_basis_index,...
         trial_derivative_degree)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end    

