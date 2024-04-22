function r=heat_solver_rectangular(result1,j,dt,N1_partition,N2_partition,N1_basis,N2_basis,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,number_of_elements,matrix_size,vector_size,number_of_trial_local_basis,number_of_test_local_basis,basis_type)

A1=assemble_matrix_from_A1_integral_rectangular(result1,j,dt,M_partition,T_partition,T_basis,T_basis,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,0,0,0,0);
A2=assemble_matrix_from_A2_integral_rectangular(result1,j,M_partition,T_partition,T_basis,T_basis,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,1,0,1,0);
A3=assemble_matrix_from_A2_integral_rectangular(result1,j,M_partition,T_partition,T_basis,T_basis,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,0,1,0,1);
% A4=assemble_matrix_from_A3_integral_rectangular(result1,j,M_partition,T_partition,T_basis,T_basis,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,basis_type,1,0,basis_type,0,0);
A5=assemble_matrix_from_A3_integral_rectangular(result1,j,M_partition,T_partition,T_basis,T_basis,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,0,1,0,0);

% A=A1+(A2+A3)-(A4+A5);
A=A1+(A2+A3)-A5;
clear  A1 A2 A3 A4 A5

b1=assemble_vector_from_b1_integral_time_rectangular(result1,j,dt,M_partition,T_partition,T_basis,number_of_test_local_basis,number_of_elements,vector_size,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,0,0);
b=b1;
clear b1 


%Get the information matrices for boundary nodes and boundary edges.
[boundary_nodes,~]=generate_boundary_nodes_edges(N1_basis,N2_basis,N1_partition,N2_partition);


[A,b]=treat_Dirichlet_boundary_rectangular('function_g',j,dt,A,b,boundary_nodes,M_basis);
r=A\b;







