function result=test_function(left,right,T,h_partition,t_partition,Gauss_point_number,Epsilon)
%test_function(0,40,10,1,1,4)
%test_function(0,40,10,0.5,0.2,4)
%left =0,right=40,T=10,h_partition=0.5,t_partition=0.2,Gauss_point_number=4,Epsilon=0.001
% basis_type=103;
% basis_type=103;
N_partition=(right-left)/h_partition;
t_number=floor(T/t_partition);


[M_partition,T_partition]=generate_M_T_1D(left,right,h_partition,101);

% if basis_type==103
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
% end

[Gauss_coefficient_reference_1D,Gauss_point_reference_1D]=generate_Gauss_reference_1D(Gauss_point_number);

number_of_elements=N_partition;

% if basis_type==103
    number_of_trial_local_basis=4;
    number_of_test_local_basis=4;
    matrix_size=[2*N_partition+2 2*N_partition+2];
    vector_size=2*N_partition+2;   
% end

result=zeros(2*N_partition+2,2*t_number+1);
result1_1=zeros(2*N_partition+2,1);
for i=1:N_partition+1
    result1_1(2*i-1,1)=function_initial(M_partition(i));
    result1_1(2*i,1)=-1.02;
end

result(:,1)=result1_1;
addpath D:\matlab\richards\—ßΩ„…„∂ØœÓ\richards_p3_CN_1D\initial_function
result(:,2)=local_richards_solver(Epsilon,T,t_partition,N_partition,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_1D,...
    Gauss_point_reference_1D,number_of_elements,number_of_trial_local_basis,number_of_test_local_basis,matrix_size,vector_size,1/2,result(:,1));

% result(:,2)=local_richards_solver(T,t_partition,N_partition,M_partition,T_partition,M_basis,T_basis,number_of_trial_local_basis,number_of_test_local_basis,number_of_elements,matrix_size,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1/2,result(:,1));
result(:,3)=local_richards_solver_1(Epsilon,T,t_partition,N_partition,M_partition,T_partition,M_basis,T_basis,number_of_trial_local_basis,...
    number_of_test_local_basis,number_of_elements,matrix_size,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,1,...
    0,result(:,1),result(:,2));


for j=5:2:2*t_number+1
    result(:,j-1)=(3/2)*result(:,j-2)-(1/2)*result(:,j-4);
    result(:,j)=local_richards_solver_1(Epsilon,T,t_partition,N_partition,M_partition,T_partition,M_basis,T_basis,number_of_trial_local_basis,...
        number_of_test_local_basis,number_of_elements,matrix_size,vector_size,Gauss_coefficient_reference_1D,Gauss_point_reference_1D,...
        (j-1)/2,result(:,j-4),result(:,j-2),result(:,j-1));
end

z=left:h_partition:right;
t=0:t_partition/2:(t_number*t_partition);
[t,z]=meshgrid(t,z);
solve=result(1:2:end,:);

mesh(t,z,solve)
xlabel('Time(s)');        
ylabel('Depth(cm)');        
zlabel('Pressure Head(cm)');

hold on

h=-1.02.*z-20.7+t.*(z-40).*z/(4*t_number*t_partition);
mesh(t,z,h)
hold off



