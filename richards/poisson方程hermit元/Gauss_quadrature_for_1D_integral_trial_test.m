function result=Gauss_quadrature_for_1D_integral_trial_test(coefficient_function_name,Gauss_coefficient_local_1D,Gauss_point_local_1D,...
    trial_vertices,trial_basis_index,trial_derivative_degree,test_vertices,test_basis_index,test_derivative_degree)

%Gpn: the number of the Gauss points of the Gauss formula we are using.我们使用的高斯公式的高斯点数。

Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
     result=result+Gauss_coefficient_local_1D(i)*feval(coefficient_function_name,Gauss_point_local_1D(i))*...
         local_basis_1D(Gauss_point_local_1D(i),trial_vertices,trial_basis_index,trial_derivative_degree)*...
         local_basis_1D(Gauss_point_local_1D(i),test_vertices,test_basis_index,test_derivative_degree);
end    

