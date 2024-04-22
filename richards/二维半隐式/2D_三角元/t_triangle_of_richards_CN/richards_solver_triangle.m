function result=richards_solver_triangle(result1_1,j,dt,N1_partition,N2_partition,N1_basis,N2_basis,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,number_of_elements,matrix_size,vector_size,number_of_trial_local_basis,number_of_test_local_basis)

A1=assemble_matrix_from_A1_integral_triangle(result1_1,j,dt,M_partition,T_partition,T_basis,T_basis,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,0,0,0,0);
A21=assemble_matrix_from_A2_integral_triangle(result1_1,j,M_partition,T_partition,T_basis,T_basis,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,1,0,1,0);
A22=assemble_matrix_from_A2_integral_triangle(result1_1,j,M_partition,T_partition,T_basis,T_basis,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,0,1,0,1);
A3=assemble_matrix_from_A3_integral_triangle(result1_1,j,M_partition,T_partition,T_basis,T_basis,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,0,1,0,0);

A=A1+(A21+A22)-A3;
clear A1 A21 A22 A3

%Assemble the load vector.
b=assemble_vector_from_b_integral_triangle(result1_1,j,dt,M_partition,T_partition,T_basis,number_of_test_local_basis,number_of_elements,vector_size,Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,0,0);

%Get the information matrices for boundary nodes and boundary edges.
[boundary_nodes,~]=generate_boundary_nodes_edges(N1_basis,N2_basis,N1_partition,N2_partition);

%Deal with Dirichlet boundary condition.
[A,b]=treat_Dirichlet_boundary_triangle('function_boundary',A,b,boundary_nodes,M_basis);

%Compute the numerical solution
result=A\b;







