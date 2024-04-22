function result=local_function(result1_1,c,element_number,M_partition,T_partition,N_partition,basis_type)

solution=result1_1;

% solution=local_richards_solver(left,right,h_partition,t_partition,basis_type,Gauss_point_number,j-1);

T_basis=zeros(4,N_partition);
    for i=1:N_partition
       T_basis(1,i)=2*i-1;    
       T_basis(2,i)=2*i;
       T_basis(3,i)=2*i+1;
       T_basis(4,i)=2*i+2; 
    end
%单元节点值
vertices_solution=solution(T_basis(:,element_number),:);

number_of_trial_local_basis=4;
vertices=M_partition(:,T_partition(:,element_number));

if (c>=M_partition(element_number) && c<M_partition(element_number+1)) || c==M_partition(N_partition+1)
   result=0;
%    x=(c-vertices(1))/(vertices(2)-vertices(1));
  for i=1:number_of_trial_local_basis
      result=result+vertices_solution(i)*local_basis_1D_reference(c,vertices,basis_type,i,0);
  end
else 
    result=0;
end
