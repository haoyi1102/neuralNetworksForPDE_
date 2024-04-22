function maxerror=get_maximum_error_1D(solution,N_partition,left,h_basis)
%compute the maximum error at all nodes for 1D problem.

maxerror=0;
for i=1:2:2*N_partition+1
    temp=solution(i)-exact_solution(left+(i-1)*h_basis);
    if abs(maxerror)<abs(temp)
        maxerror=temp;
    end
end