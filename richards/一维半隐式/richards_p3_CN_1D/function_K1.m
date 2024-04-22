function result=function_K1(result1_2,vertices,T_basis,x,j,n,test_derivative_degree)

if j==1/2
    h=function_initial(x);
else
    h=global_function1(result1_2,vertices,T_basis,x,j,n,test_derivative_degree);
end

K_s=0.00944;
A=1.175e6;
gamma=4.74;
result=(K_s*A)/(A+abs(h)^gamma);
