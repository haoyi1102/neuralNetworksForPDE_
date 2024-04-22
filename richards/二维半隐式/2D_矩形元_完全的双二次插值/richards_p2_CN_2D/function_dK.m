function result=function_dK(result1,vertices,T_basis,x,y,j,n,test_derivative_degree_x,test_derivative_degree_y)

if j==1/2
    h=function_initial(x,y);
else
    h=global_function(result1,vertices,T_basis,x,y,j,n,test_derivative_degree_x,test_derivative_degree_y);
end

if y>=5
    theta_r=0.034;
    theta_s=0.46;
    c=0.016;
    n=1.37;
    K=0.25/3600;
else 
    theta_r=0.120;
    theta_s=0.5;
    c=0.028;
    n=3;
    K=2/3600;
end
m=0.5;
% sign(h)=-1;
% result=(2*K_s*((err*sign(h)*(err*abs(h))^(n - 2)*(n - 1))/((err*abs(h))^n + 1)^m - (err*m*n*sign(h)*(err*abs(h))^(2*n - 2))/((err*abs(h))^n + 1)^(m + 1))*((err*abs(h))^(n - 1)/((err*abs(h))^n + 1)^m - 1))/((err*abs(h))^n + 1)^(m/2) - (K_s*err*m*n*sign(h)*((err*abs(h))^(n - 1)/((err*abs(h))^n + 1)^m - 1)^2*(err*abs(h))^(n - 1))/(2*((err*abs(h))^n + 1)^(m/2 + 1));
result=(1/2)*c^n*K*m*n*abs(h)^(n-1)*(1+c^n*abs(h)^n)^(-1-m/2)*(1-c^(-1+n)*abs(h)^(-1+n)*(1+c^n*abs(h)^n)^(-m))^2+2*K*(1+c^n*abs(h)^n)^(-m/2)*(1-c^(-1+n)*abs(h)^(-1+n)*(1+c^n*abs(h)^n)^(-m))*(c^(-1+2*n)*m*n*abs(h)^(-2+2*n)*(1+c^n*abs(h)^n)^(-1-m)*(-1)-c^(-1+n)*(-1+n)*abs(h)^(-2+n)*(1+c^n*abs(h)^n)^(-m)*(-1));
