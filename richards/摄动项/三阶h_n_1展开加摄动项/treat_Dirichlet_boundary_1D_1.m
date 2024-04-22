function [A,b]=treat_Dirichlet_boundary_1D_1(A,b,boundary_nodes_1,M_basis,j,t_partition,T)
%nbn: the total number of all the boundary nodes of FE.

nbn=size(boundary_nodes_1,2);

%Check all boundary nodes of FE.
for k=1:nbn
%     if boundary_nodes(1,k)==-1 
        i=boundary_nodes_1(2,k);
        A(i,:)=0;
        A(i,i)=1;
        b(i,1)= function_boundary_1(M_basis(i),j,t_partition,T);
%     end

end