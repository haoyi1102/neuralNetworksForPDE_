function r=rectangular_local_basis(x,y,vertices,basis_index,derivative_degree_x,derivative_degree_y)
h1=vertices(1,2)-vertices(1,1);
h2=vertices(2,4)-vertices(2,1);

J_1=2/h1;
J_2=2/h2;

x_hat=(2*x-2*vertices(1,1)-h1)/h1;
y_hat=(2*y-2*vertices(2,1)-h2)/h2;

if derivative_degree_x==0&&derivative_degree_y==0
    r=rectangular_reference_basis(x_hat,y_hat,basis_index,0,0);
elseif derivative_degree_x==1&&derivative_degree_y==0
    r=rectangular_reference_basis(x_hat,y_hat,basis_index,1,0)*J_1;
elseif derivative_degree_x==0&&derivative_degree_y==1
    r=rectangular_reference_basis(x_hat,y_hat,basis_index,0,1)*J_2;
end