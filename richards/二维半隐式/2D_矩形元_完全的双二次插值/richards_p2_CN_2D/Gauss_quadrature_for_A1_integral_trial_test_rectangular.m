function r=Gauss_quadrature_for_A1_integral_trial_test_rectangular(n,result2,j,dt,T_basis,Gauss_coefficient_local,Gauss_point_local,vertices,trial_basis_index,trial_derivative_degree_x,trial_derivative_degree_y,test_basis_index,test_derivative_degree_x,test_derivative_degree_y)

Gpn=length(Gauss_coefficient_local);
r=0;
for i=1:Gpn
    C=function_C(result2,vertices,T_basis,Gauss_point_local(i,1),Gauss_point_local(i,2),j,n,0,0);
     r=r+(1/dt)*Gauss_coefficient_local(i)*C*rectangular_local_basis(Gauss_point_local(i,1),Gauss_point_local(i,2),vertices,trial_basis_index,trial_derivative_degree_x,trial_derivative_degree_y)*rectangular_local_basis(Gauss_point_local(i,1),Gauss_point_local(i,2),vertices,test_basis_index,test_derivative_degree_x,test_derivative_degree_y);
end