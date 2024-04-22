function relative_error=get_error(h1)
% h1=([1,1])
T=30;
left=0;right=40;
bottom=0;top=40;
Gauss_point_number=9;



dt1=5;
Numerical_global_solution_1=test_function(left,right,bottom,top,h1,T,dt1);
Numerical_solution_1=Numerical_global_solution_1(:,end);

dt2=3;
Numerical_global_solution_2=test_function(left,right,bottom,top,h1,T,dt2);
Numerical_solution_2=Numerical_global_solution_2(:,end);

dt3=2.5;
Numerical_global_solution_3=test_function(left,right,bottom,top,h1,T,dt3);
Numerical_solution_3=Numerical_global_solution_3(:,end);

dt4=2;
Numerical_global_solution_4=test_function(left,right,bottom,top,h1,T,dt4);
Numerical_solution_4=Numerical_global_solution_4(:,end);

dt5=1.5;
Numerical_global_solution_5=test_function(left,right,bottom,top,h1,T,dt5);
Numerical_solution_5=Numerical_global_solution_5(:,end);

dt6=1;
Numerical_global_solution_6=test_function(left,right,bottom,top,h1,T,dt6);
Numerical_solution_6=Numerical_global_solution_6(:,end);


% h_min=[0.5 0.5];
% approximate_global_solutions=test_function(left,right,bottom,top,h_min,T,min_dt);
approximate_solutions=xlsread('最小步长CN.xlsx','A1:A25921');

Absolute_error_1=FE_solution_error_triangle(Numerical_solution_1,approximate_solutions,left,right,bottom,top,h1,0,0,Gauss_point_number);
Absolute_error_2=FE_solution_error_triangle(Numerical_solution_2,approximate_solutions,left,right,bottom,top,h1,0,0,Gauss_point_number);
Absolute_error_3=FE_solution_error_triangle(Numerical_solution_3,approximate_solutions,left,right,bottom,top,h1,0,0,Gauss_point_number);
Absolute_error_4=FE_solution_error_triangle(Numerical_solution_4,approximate_solutions,left,right,bottom,top,h1,0,0,Gauss_point_number);
Absolute_error_5=FE_solution_error_triangle(Numerical_solution_5,approximate_solutions,left,right,bottom,top,h1,0,0,Gauss_point_number);
Absolute_error_6=FE_solution_error_triangle(Numerical_solution_6,approximate_solutions,left,right,bottom,top,h1,0,0,Gauss_point_number);


exact_solution=605.1412;

relative_error_1=Absolute_error_1/exact_solution;
relative_error_2=Absolute_error_2/exact_solution;
relative_error_3=Absolute_error_3/exact_solution;
relative_error_4=Absolute_error_4/exact_solution;
relative_error_5=Absolute_error_5/exact_solution;
relative_error_6=Absolute_error_6/exact_solution;

relative_error=[relative_error_1
                relative_error_2
                relative_error_3
                relative_error_4
                relative_error_5
                relative_error_6];




% error=Numerical_solution-approximate_solutions;
% result=norm(error,'inf');

















