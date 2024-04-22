function result=function_dK1(result1,vertices,T_basis,x,y,j,n,trial_derivative_degree_x,trial_derivative_degree_y)

if j==1/2
    h=function_initial(x,y);
else
    h=global_function1(result1,vertices,T_basis,x,y,j,n,trial_derivative_degree_x,trial_derivative_degree_y);
end

if y>=5
    theta_r=0.034;
    theta_s=0.46;
    c=0.016;
    n=1.37;
    K=0.25/3600;
    m=1-1/n;
else 
    theta_r=0.120;
    theta_s=0.5;
    c=0.028;
    n=3;
    K=2/3600;
    m=1-1/n;
end
% m=0.5;
result=(1/2)*c^n*K*m*n*abs(h)^(n-1)*(1+c^n*abs(h)^n)^(-1-m/2)*(1-c^(-1+n)*abs(h)^(-1+n)*(1+c^n*abs(h)^n)^(-m))^2+2*K*(1+c^n*abs(h)^n)^(-m/2)*(1-c^(-1+n)*abs(h)^(-1+n)*(1+c^n*abs(h)^n)^(-m))*(c^(-1+2*n)*m*n*abs(h)^(-2+2*n)*(1+c^n*abs(h)^n)^(-1-m)*(-1)-c^(-1+n)*(-1+n)*abs(h)^(-2+n)*(1+c^n*abs(h)^n)^(-m)*(-1));
