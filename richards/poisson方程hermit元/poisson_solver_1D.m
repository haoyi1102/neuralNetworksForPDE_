function result=poisson_solver_1D(left,right,h_partition,Gauss_point_number)
%poisson_solver_1D(0,1,0.25,4)
%left=0,right=1,h_partition=0.25,Gauss_point_number=4
%Finite element solver for 1D Poisson equation.
%h_partition是分区的步长。
%basis_type：有限元基函数的类型。

N_partition=(right-left)/h_partition;%总共多少分区


%分区和有限元基函数的网格信息，生成每个节点的节点值和节点编号
[M_partition,T_partition]=generate_M_T_1D(left,right,h_partition,101);

%生成有限元节点的节点值和节点编号
M_basis=zeros(1,2*N_partition+2);
M_basis(1,1:2:end)=M_partition;
M_basis(1,2:2:end)=M_partition;
T_basis=zeros(4,N_partition);
  for i=1:N_partition
       T_basis(1,i)=2*i-1;    
       T_basis(2,i)=2*i;
       T_basis(3,i)=2*i+1;
       T_basis(4,i)=2*i+2; 
  end


%Gauss_legendre求积公式所需要的节点和系数
[Gauss_coefficient_reference_1D,Gauss_point_reference_1D]=generate_Gauss_reference_1D(Gauss_point_number);

%单元个数，单元基函数个数，生成总刚度矩阵和总荷载向量的维数
number_of_elements=N_partition;
number_of_trial_local_basis=4;
number_of_test_local_basis=4;
matrix_size=[2*N_partition+2 2*N_partition+2];
vector_size=2*N_partition+2;   

%Assemble the stiffness matrix 从一维积分组装矩阵,刚度矩阵
A=assemble_matrix_from_1D_integral('function_a',M_partition,T_partition,T_basis,T_basis,number_of_trial_local_basis,...
    number_of_test_local_basis,number_of_elements,matrix_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1,1);


%Assemble the load vector.荷载向量
b=assemble_vector_from_1D_integral('function_f',M_partition,T_partition,T_basis,number_of_test_local_basis,number_of_elements,...
    vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,0);


%Get the information matrix for boundary nodes.获取边界节点的信息矩阵。
boundary_nodes=generate_boundary_nodes_1D(N_partition);

%Deal with Dirichlet boundary condition.边界条件处理
[A,b]=treat_Dirichlet_boundary_1D('function_g',A,b,boundary_nodes,M_basis);

%Compute the numerical solution
result=A\b;

%compute the maximum error at all nodes.

h_basis=h_partition;
maxerror=get_maximum_error_1D(result,M_basis,left,h_basis);
maximum_error_at_all_nodes_of_FE=maxerror







