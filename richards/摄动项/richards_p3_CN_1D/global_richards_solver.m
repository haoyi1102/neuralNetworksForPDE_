function result=global_richards_solver(left,right,T,h_partition,t_partition,basis_type,Gauss_point_number)

N_partition=(right-left)/h_partition;
t_number=T/t_partition;

result=zeros(2*N_partition+2,t_number+1);
result1_1=zeros(2*N_partition+2,1);
[M_partition,~]=generate_M_T_1D(left,right,h_partition,101);
for i=1:N_partition+1
    result1_1(2*i-1,1)=function_initial(M_partition(i));
    result1_1(2*i,1)=-1.02;
end

result(:,1)=result1_1;

for j=2:t_number+1
    result(:,j)=local_richards_solver(left,right,T,h_partition,t_partition,basis_type,Gauss_point_number,j-1,result(:,j-1));
end

z=left:h_partition:right;
t=0:t_partition:T;
[t,z]=meshgrid(t,z);
solve=result(1:2:end,:);

%  h=-1.02.*z-20.7+t.*(z-40).*z/(4*T);
mesh(t,z,solve)
hold on

h=-1.02.*z-20.7+t.*(z-40).*z/(4*T);
mesh(t,z,h)
hold off










