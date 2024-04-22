function result=function_C(result1_1,vertices,T_basis,x,j,n,test_derivative_degree)

if j==1/2
    h=function_initial(x);
else
    h=global_function(result1_1,vertices,T_basis,x,j,n,test_derivative_degree);
end

alpha=1.611e6;
theta_s=0.287;
theta_r=0.075;
beta=3.96;

bamma=0;
result=(alpha*(theta_s-theta_r)*beta*abs(h)^(beta-1))/(alpha+abs(h)^beta)^2+bamma;