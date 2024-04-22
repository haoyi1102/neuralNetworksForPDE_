function [Gauss_coefficient_reference_rectangular,Gauss_point_reference_rectangular]=generate_Gauss_reference_rectangular(Gauss_point_number)
%Generate the Gauss coefficients and Gauss points on the reference rectangular whose vertices are (-1,1),(-1,1)

if Gauss_point_number==4
    gpt=1/sqrt(3);
    Gauss_coefficient_reference_rectangular=[1,1,1,1];
    Gauss_point_reference_rectangular=[ -gpt,-gpt;gpt,-gpt;gpt,gpt;-gpt,gpt];
elseif Gauss_point_number==9
    gpt=sqrt(0.6);
    Gauss_coefficient_reference_rectangular=[25/81,25/81,25/81,25/81,40/81,40/81,40/81,40/81,64/81];
    Gauss_point_reference_rectangular=[-gpt,-gpt; gpt,-gpt;gpt,gpt;-gpt,gpt;0,-gpt;gpt,0;0,gpt;-gpt,0;0,0];
end

