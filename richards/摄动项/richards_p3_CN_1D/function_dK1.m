function result=function_dK1(result1_1,vertices,T_basis,x,j,n,test_derivative_degree)

if j==1/2
    h=function_initial(x);
else
    h=global_function1(result1_1,vertices,T_basis,x,j,n,test_derivative_degree);
end

K_s=0.00944;
A=1.175e6;
gamma=4.74;
result=(K_s*A*gamma*abs(h)^(gamma-1))/(A+abs(h)^gamma)^2;
