function [A,b]=treat_Dirichlet_boundary_rectangular(Dirichlet_boundary_function_name,A,b,boundary_nodes,M_basis)

%nbn: the total number of all the boundary nodes of FE.

nbn=size(boundary_nodes,2);

%Check all boundary nodes of FE.
for k=1:nbn


    if boundary_nodes(1,k)==-1 
        i=boundary_nodes(2,k);
        A(i,:)=0;
        A(i,i)=1;
        b(i,1)=feval(Dirichlet_boundary_function_name,M_basis(1,i),M_basis(2,i));
    end

end