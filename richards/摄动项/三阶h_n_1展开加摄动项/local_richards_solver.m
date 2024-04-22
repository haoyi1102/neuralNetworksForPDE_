function result=local_richards_solver(T,t_partition,N_partition,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_1D,...
    Gauss_point_reference_1D,number_of_elements,number_of_trial_local_basis,number_of_test_local_basis,matrix_size,vector_size,j,result1_1,...
    result1_2,result1_3)

%�����ܸնȾ���
A1=assemble_matrix_from_C_integral(j,result1_1,result1_2,result1_3,t_partition,T_basis,M_partition,T_partition,number_of_trial_local_basis,...
    number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,0,0);
A2=assemble_matrix_from_E_integral(T_basis,M_partition,T_partition,number_of_trial_local_basis,number_of_test_local_basis,...
    number_of_elements,matrix_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1,1);
A=A1+A2;

%�����ܺ�������
b1=assemble_vector_from_1D_integral(j,result1_1,result1_2,result1_3,T,t_partition,T_basis,M_partition,T_partition,number_of_test_local_basis,...
    number_of_elements,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,0);
b2=assemble_vector_from_B1_integral(j,result1_1,result1_2,result1_3,T_basis,M_partition,T_partition,number_of_test_local_basis,...
    number_of_elements,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1);
b=b1+b2;
%�߽������ͺͱ��
boundary_nodes=generate_boundary_nodes_1D(N_partition);
%boundary_nodes_1=generate_boundary_nodes_s(N_partition);
%�������
[A,b]=treat_Dirichlet_boundary_1D('function_boundary',A,b,boundary_nodes,M_basis);
%[A,b]=treat_Dirichlet_boundary_1D_1(A,b,boundary_nodes_1,M_basis,j,t_partition,T);
result=A\b;

