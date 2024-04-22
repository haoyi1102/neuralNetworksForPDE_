function result=Gauss_quadrature_for_dK_integral_test(j,n,result1_1,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,test_basis_index,test_derivative_degree)

Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    %”“∂ÀœÓ=(1/t)C(h_n)h_n+g(z,t)
    dK=function_dK(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n,0);
    %C=function_C(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    global_solver=global_function(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n,1);
%     g_function=function_g(Gauss_point_local_1D(i),(j-1)*t_partition,T);
   
    
    result=result+Gauss_coefficient_local_1D(i)*dK*global_solver*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end   