function[xsol] = jacfull(A,b,N)
[Nrow,Ncol]= size(A);
Nvec = length(b);
%if error ~= 0
%end
xsol = zeros(N,1);
error=1E3;
it=0;
while error > 1E-8
    it = it +1;
    xsolold = xsol;
    for i=1:N
        sum=0;
        for j=1:N
            if i~=j
                sum= sum + A(i,j)*xsolold(j);
            end
        end
        xsol(i)= (b(i)-sum)/A(i,i);
    end
    sum = 0;

    for i=1:N
        sum =sum + xsol(i)^2;
    end
    solnorm = sqrt(sum);
    difnorm = norm(xsol - xsolold);
    error = difnorm/solnorm;
    midsol= xsol(floor((N+1)/2));
end
fprintf("Iterations: %5.0f, rel.error: %5.5e", it, error)
end