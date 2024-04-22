function result=Gauss_quadrature_for_E_integral_trial_test_F(vertices,Gauss_coefficient_local_1D,Gauss_point_local_1D,trial_basis_index,...
    trial_derivative_degree,test_basis_index,test_derivative_degree)


Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    %×ó¶ËµÚ¶þÏî=E*(dh_n+1)
   E=function_e;
     result=result+Gauss_coefficient_local_1D(i)*E*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,trial_basis_index,...
         trial_derivative_degree)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end    

