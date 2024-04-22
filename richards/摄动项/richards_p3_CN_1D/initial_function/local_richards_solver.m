function result=local_richards_solver(Epsilon,T,t_partition,N_partition,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,number_of_elements,number_of_trial_local_basis,number_of_test_local_basis,matrix_size,vector_size,j,result1_1)

%�����ܸնȾ���
%����C_1��
A1=assemble_matrix_from_C_integral(j,result1_1,t_partition,T_basis,M_partition,T_partition,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,0,0);
%�����㶯 H_n+1
A2=assemble_matrix_from_Epsilon_integral(Epsilon,T_basis,M_partition,T_partition,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1,1);
A=A1+A2;
%A3=assemble_matrix_from_dK_integral(j,result1_1,T_basis,M_partition,T_partition,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1,0);


%�����ܺ�������
B1=assemble_vector_from_1D_integral(j,result1_1,T,t_partition,T_basis,M_partition,T_partition,number_of_test_local_basis,number_of_elements,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,0);
E2=assemble_vector_from_E2_integral(Epsilon,j,result1_1,T_basis,M_partition,T_partition,number_of_test_local_basis,number_of_elements,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1);
B2=assemble_vector_from_K_integral(j,result1_1,T_basis,M_partition,T_partition,number_of_test_local_basis,number_of_elements,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1);
B3=assemble_vector_from_dK_integral(j,result1_1,T_basis,M_partition,T_partition,number_of_test_local_basis,number_of_elements,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,0);

B=B1+E2-B2+B3;
%�߽������ͺͱ��
boundary_nodes=generate_boundary_nodes_1D(N_partition);

%�������
[A,B]=treat_Dirichlet_boundary_1D('function_boundary',A,B,boundary_nodes,M_basis);

result=A\B;

