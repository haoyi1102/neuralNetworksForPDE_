function result=Gauss_quadrature_for_C_integral_trial_test(t_partition,vertices,Gauss_coefficient_local_1D,Gauss_point_local_1D,...
    trial_basis_index,trial_derivative_degree,test_basis_index,test_derivative_degree)

%数值积分
Gpn=length(Gauss_coefficient_local_1D);
%左端第一项 =(1/t)*(h_n+1)
result=0;
for i=1:Gpn
     result=result+(1/t_partition)*Gauss_coefficient_local_1D(i)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,trial_basis_index,...
         trial_derivative_degree)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end    

