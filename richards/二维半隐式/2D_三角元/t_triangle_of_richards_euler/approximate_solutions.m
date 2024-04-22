function [A,B,C]=approximate_solutions(T)
A=test_function(0,100,0,100,[25 25],T,1e-04);
A=A(:,end);
B=test_function(0,100,0,100,[10 10],T,1e-04);
B=B(:,end);
C=test_function(0,100,0,100,[5 5],T,1e-04);
C=C(:,end);


