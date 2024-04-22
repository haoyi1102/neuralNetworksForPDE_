function r=Gauss_quadrature_for_b1_integral_test_time_rectangular(n,result1,result2,j,dt,T_basis,Gauss_coefficient_local,Gauss_point_local,vertices,test_basis_index,test_derivative_degree_x,test_derivative_degree_y)

Gpn=length(Gauss_coefficient_local);
r=0;
for i=1:Gpn
    C=function_C(result2,vertices,T_basis,Gauss_point_local(i,1),Gauss_point_local(i,2),j,n,0,0);
    global_solver=global_function(result1,vertices,T_basis,Gauss_point_local(i,1),Gauss_point_local(i,2),j-1/2,n,0,0);
    r=r+(1/dt)*Gauss_coefficient_local(i)*C*global_solver*rectangular_local_basis(Gauss_point_local(i,1),Gauss_point_local(i,2),vertices,test_basis_index,test_derivative_degree_x,test_derivative_degree_y);
end