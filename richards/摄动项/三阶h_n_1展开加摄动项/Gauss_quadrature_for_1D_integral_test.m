function result=Gauss_quadrature_for_1D_integral_test(j,n,result1_1,result1_2,result1_3,T,t_partition,vertices,T_basis,Gauss_coefficient_local_1D,Gauss_point_local_1D,test_basis_index,test_derivative_degree)

Gpn=length(Gauss_coefficient_local_1D);

result=0;
for i=1:Gpn
    %”“∂ÀœÓ=(1/6t)C(h^_n_1)*(18h_n-9h_n_1+2h_n_2)+g(z,t)+dK(h^_n_1)dh^_n_1
    h_n_1 = 3*result1_1-3*result1_2+result1_3;
    C=function_C(h_n_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    global_solver_n=global_function(result1_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    global_solver_n_1=global_function(result1_2,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    global_slover_n_2=global_function(result1_3,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    g_function=function_g(Gauss_point_local_1D(i),j*t_partition,T);
    dK=function_dK(h_n_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    dglobal_solver = dglobal_function(h_n_1,vertices,T_basis,Gauss_point_local_1D(i),j,n);
    
    result=result+Gauss_coefficient_local_1D(i)*(C/6*(18*global_solver_n - 9*global_solver_n_1 +2*global_slover_n_2)/t_partition...
        +g_function+dK*dglobal_solver)*local_basis_1D_reference(Gauss_point_local_1D(i),vertices,test_basis_index,test_derivative_degree);
end   