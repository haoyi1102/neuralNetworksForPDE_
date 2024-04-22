function r=Gauss_quadrature_for_A2_integral_trial_test_triangle(n,result1_1,j,T_basis,Gauss_coefficient_local,Gauss_point_local,vertices,trial_basis_index,trial_derivative_degree_x,trial_derivative_degree_y,test_basis_index,test_derivative_degree_x,test_derivative_degree_y)

Gpn=length(Gauss_coefficient_local);
r=0;
for i=1:Gpn
    K=function_K(result1_1,vertices,T_basis,Gauss_point_local(i,1),Gauss_point_local(i,2),j,n);
     r=r+Gauss_coefficient_local(i)*K*triangular_local_basis(Gauss_point_local(i,1),Gauss_point_local(i,2),vertices,trial_basis_index,trial_derivative_degree_x,trial_derivative_degree_y)*triangular_local_basis(Gauss_point_local(i,1),Gauss_point_local(i,2),vertices,test_basis_index,test_derivative_degree_x,test_derivative_degree_y);
end