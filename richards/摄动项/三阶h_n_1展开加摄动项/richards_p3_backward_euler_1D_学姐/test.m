function result=test(left,right,T,h_partition,t_partition,Gauss_point_number)
%test(0,40,10,1,1,4)
%test_function(0,40,10,0.5,0.2,4)
%left=0,right=40,T=10,h_partition=1,t_partition=1,Gauss_point_number=4
%t_number=floor(T/t_partition);
N_partition=(right-left)/h_partition;

%生成每个节点的节点值和节点编号
[M_partition,T_partition]=generate_M_T_1D(left,right,h_partition,101);
%[M_partition,T_partition]=generate_M_T_1D(0,40,1,101);

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

t_number_1 = power(t_partition,1/3);
t_number_2 = round(1/(t_number_1*t_number_1));
%将每一时间层的数值解放进对应矩阵的列
result=zeros(2*N_partition+2,2*t_number_2+1);

%初值
result1_1=zeros(2*N_partition+2,1);
for i=1:N_partition+1
    result1_1(2*i-1,1)=function_initial(M_partition(i));
    result1_1(2*i,1)=-1.02;
end

result(:,1)=result1_1;


%通过循环得到每一层的结果
for j=2:2*t_number_2+1
    result(:,j)=local_richards_solver_E(T,t_partition,N_partition,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,number_of_elements,number_of_trial_local_basis,number_of_test_local_basis,matrix_size,vector_size,j-1,result(:,j-1));
end

% for j=2:3
%     result(:,j)=local_richards_solver_E(T,t_partition,N_partition,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,number_of_elements,number_of_trial_local_basis,number_of_test_local_basis,matrix_size,vector_size,j-1,result(:,j-1));
% end

% z=left:h_partition:right;
% t=0:t_partition:(t_number*t_partition);
% [t,z]=meshgrid(t,z);
% solve=result(1:2:end,:);
% 
% mesh(t,z,solve)
% xlabel('Time(s)');        
% ylabel('Depth(cm)');        
% zlabel('Pressure Head(cm)');
% hold on
% 
% h=-1.02.*z+19.3+t.*(z-40).*z/(4*t_number*t_partition);
% mesh(t,z,h)
% hold off



