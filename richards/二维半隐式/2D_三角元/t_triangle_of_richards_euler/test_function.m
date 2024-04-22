function result=test_function(left,right,bottom,top,h_partition,T,dt)
%left = 0,right=40,bottom=0,top=40,h_partition = [2,2],T=10,dt=1
%test_function(0,40,0,40,[2,2],10,1)
N_t=T/dt;%时间剖分
N1_partition=(right-left)/h_partition(1);
N2_partition=(top-bottom)/h_partition(2);%空间剖分
N1_basis=N1_partition*2;
N2_basis=N2_partition*2;
h_basis=h_partition/2;

[M_partition,T_partition]=generate_M_T_triangle(left,right,bottom,top,h_partition,1);%M_partition 坐标 ，T_partition 节点编号
[M_basis,T_basis]=generate_M_T_triangle(left,right,bottom,top,h_partition,2);
[Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle]=generate_Gauss_reference_triangle(9);
% [Gauss_coefficient_reference_1D,Gauss_point_reference_1D]=generate_Gauss_reference_1D(4);

number_of_elements=2*N1_partition*N2_partition; %有限元个数
number_of_trial_local_basis=6; %二次插值基函数
number_of_test_local_basis=6;
matrix_size=[(N1_basis+1)*(N2_basis+1) (N1_basis+1)*(N2_basis+1)];
vector_size=(N1_basis+1)*(N2_basis+1);

%  初值
result=zeros((N1_basis+1)*(N2_basis+1),N_t+1);
for i=1:(N1_basis+1)*(N2_basis+1)
    result(i,1)=function_initial(M_basis(1,i),M_basis(2,i));
end


for j=2:N_t+1
    result(:,j)=richards_solver_triangle(result(:,j-1),j-1,dt,N1_partition,N2_partition,N1_basis,N2_basis,M_partition,T_partition,M_basis,T_basis,...
        Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,number_of_elements,matrix_size,vector_size,number_of_trial_local_basis,...
        number_of_test_local_basis);
end


% result(:,N_t+2)=richards_solver_triangle(result(:,N_t+1),N_t+1,2,N1_partition,N2_partition,N1_basis,N2_basis,M_partition,T_partition,M_basis,T_basis,Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,number_of_elements,matrix_size,vector_size,number_of_trial_local_basis,number_of_test_local_basis);



%绘图
result_1=zeros(N1_basis+1,N2_basis+1);
for i=1:N1_basis+1
    result_1(:,i)=result((i-1)*N2_basis+i:i*N2_basis+i,end);
end
x=left:h_basis(1):right;
y=bottom:h_basis(2):top;
% [x,y]=meshgrid(x,y);
% tri=delaunay(x,y);
% trimesh(tri,x,y,result_1)
surf(x,y,result_1,'EdgeColor','None','facecolor', 'interp')
hold on
xlabel('x')
ylabel('z')
view(2)

