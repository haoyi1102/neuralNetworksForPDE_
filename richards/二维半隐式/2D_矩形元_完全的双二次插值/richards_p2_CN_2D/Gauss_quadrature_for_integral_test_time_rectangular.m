function r=Gauss_quadrature_for_integral_test_time_rectangular(n,result1,j,dt,T_basis,Gauss_coefficient_local,Gauss_point_local,vertices,test_basis_index,test_derivative_degree_x,test_derivative_degree_y)

Gpn=length(Gauss_coefficient_local);
r=0;
for i=1:Gpn
    C1=function_C1(result1,vertices,T_basis,Gauss_point_local(i,1),Gauss_point_local(i,2),j,n);
    global_solver=global_function1(result1,vertices,T_basis,Gauss_point_local(i,1),Gauss_point_local(i,2),j,n);
    r=r+(2/dt)*Gauss_coefficient_local(i)*C1*global_solver*rectangular_local_basis(Gauss_point_local(i,1),Gauss_point_local(i,2),vertices,test_basis_index,test_derivative_degree_x,test_derivative_degree_y);
end