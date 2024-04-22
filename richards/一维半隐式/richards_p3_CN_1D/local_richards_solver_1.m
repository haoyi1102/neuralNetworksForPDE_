function result=local_richards_solver_1(T,t_partition,N_partition,M_partition,T_partition,M_basis,T_basis,number_of_trial_local_basis,...
    number_of_test_local_basis,number_of_elements,matrix_size,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,j,result1_1,result1_2)

A1=assemble_matrix_from_C_integral_left(j,result1_2,t_partition,M_partition,T_partition,T_basis,number_of_trial_local_basis,number_of_test_local_basis,...
    number_of_elements,matrix_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,0,0);
A2=assemble_matrix_from_K_integral_left(j,result1_2,M_partition,T_partition,T_basis,number_of_trial_local_basis,number_of_test_local_basis,...
    number_of_elements,matrix_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1,1);
A3=assemble_matrix_from_dK_integral_left(j,result1_2,M_partition,T_partition,T_basis,number_of_trial_local_basis,number_of_test_local_basis,...
    number_of_elements,matrix_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1,0);
A=A1+A2-A3;

B1=assemble_matrix_from_C_integral_right(j,result1_1,result1_2,T,t_partition,M_partition,T_partition,T_basis,number_of_test_local_basis,...
    number_of_elements,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,0);
B2=assemble_matrix_from_K_integral_right(j,result1_1,result1_2,M_partition,T_partition,T_basis,number_of_test_local_basis,number_of_elements,...
    vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1);
B3=assemble_matrix_from_dK_integral_right(j,result1_1,result1_2,M_partition,T_partition,T_basis,number_of_test_local_basis,number_of_elements,...
    vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,0);
b=B1-B2+B3;

boundary_nodes=generate_boundary_nodes_1D(N_partition);

[A,b]=treat_Dirichlet_boundary_1D('function_boundary',A,b,boundary_nodes,M_basis);

result=A\b;