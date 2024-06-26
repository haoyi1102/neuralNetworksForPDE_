function boundary_nodes=generate_boundary_nodes_1D(N_basis,basis_type)

%boundary_nodes(1,k): specifiy the type of the kth boundary node.
%boundary_nodes(1,k)=-1: Dirichlet boundary node;
%boundary_nodes(1,k)=-2: Neumann boundary node;
%boundary_nodes(1,k)=-3: Robin boundary node. 
%boundary_nodes(2,k): global index of the kth boundary node among all nodes of FE. 
%                     That is, the index of FE is used here.
%boundary_nodes(3,k): The normal direction of the kth boundary node.
if  basis_type ==103
    boundary_nodes(1,1)=-1;
    boundary_nodes(2,1)=1;
    boundary_nodes(3,1)=-1;
    boundary_nodes(1,2)=-1;
    boundary_nodes(2,2)=2*N_basis+1;
    boundary_nodes(3,2)=1;
end