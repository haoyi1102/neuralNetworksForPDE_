function result=function_C1(result1,vertices,T_basis,x,y,j,n,trial_derivative_degree_x,trial_derivative_degree_y)

if j==1/2
    h=function_initial(x,y);
else
    h=global_function1(result1,vertices,T_basis,x,y,j,n,trial_derivative_degree_x,trial_derivative_degree_y);
end

if y >= 5
    theta_r=0.034;
    theta_s=0.46;
    err=0.016;
    n=1.37;
    K_s=0.25/3600;
    m=1-1/n;
else
   theta_r=0.120;
    theta_s=0.5;
    err=0.028;
    n=3;
    K_s=2/3600;
    m=1-1/n;
end
% m=0.5;
result=(m*n*err^n*abs(h)^(n - 1)*(theta_s - theta_r))/(err^n*abs(h)^n + 1)^(m + 1);