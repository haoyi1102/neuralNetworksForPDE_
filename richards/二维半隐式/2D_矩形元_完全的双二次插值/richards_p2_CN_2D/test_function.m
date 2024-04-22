function result=test_function(left,right,bottom,top,h_partition,T,dt)
N_t=T/dt;

N1_partition=(right-left)/h_partition(1);
N2_partition=(top-bottom)/h_partition(2);

N1_basis=N1_partition*2;
N2_basis=N2_partition*2;
h_basis=h_partition/2;

%Mesh information for partition and finite element basis functions.
[M_partition,T_partition]=generate_M_T_rectangular(left,right,bottom,top,h_partition,1);
[M_basis,T_basis]=generate_M_T_rectangular(left,right,bottom,top,h_partition,2);

%Guass quadrature's points and weights on the refenrece triangle and reference interval.
[Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular]=generate_Gauss_reference_rectangular(9);

number_of_elements=N1_partition*N2_partition;
number_of_unknowns=(N1_basis+1)*(N2_basis+1);
matrix_size=[number_of_unknowns number_of_unknowns];
vector_size=number_of_unknowns;

number_of_trial_local_basis=9;
number_of_test_local_basis=9;


result=zeros((N1_basis+1)*(N2_basis+1),2*N_t+1);
for i=1:(N1_basis+1)*(N2_basis+1)
    result(i,1)=function_initial(M_basis(1,i),M_basis(2,i));
end

result(:,2)=solver_rectangular1(result(:,1),1/2,dt,N1_partition,N2_partition,N1_basis,N2_basis,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,number_of_elements,matrix_size,vector_size,number_of_trial_local_basis,number_of_test_local_basis);
result(:,3)=heat_solver_rectangular(result(:,1),result(:,2),1,dt,N1_partition,N2_partition,N1_basis,N2_basis,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,number_of_elements,matrix_size,vector_size,number_of_trial_local_basis,number_of_test_local_basis);
     
for j=5:2:2*N_t+1
    result(:,j-1)=(3/2)*result(:,j-2)-(1/2)*result(:,j-4);
    result(:,j)=heat_solver_rectangular(result(:,j-2),result(:,j-1),(j-1)/2,dt,N1_partition,N2_partition,N1_basis,N2_basis,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular,number_of_elements,matrix_size,vector_size,number_of_trial_local_basis,number_of_test_local_basis);
end
  



%  »æÖÆ
result_1=zeros(N1_basis+1,N2_basis+1);
for i=1:N1_basis+1
    result_1(:,i)=result((i-1)*N2_basis+i:i*N2_basis+i,end);
end
x=left:h_basis(1):right;
y=bottom:h_basis(2):top;
[y,x]=meshgrid(y,x);
mesh(y,x,result_1)
hold on

 
    
    
    
    
    
    
    
    
    
    