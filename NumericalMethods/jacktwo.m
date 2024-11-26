
xsol = zeros(N,1);
error=1E3;
it=0;
while error > 1E-8
    it = it +1;
    xsolold = xsol;

    % new solution with jacobi
    i=1;
    sum=0;
    j = i+1;
    sum = sum+A(i,j)*xsolold(j);
    xsol(i) = (b(i)-sum)/A(i,i);
    for i=2:N-1
        sum=0;
        j = i-1;
        sum = sum+A(i,j)*xsolold(j);
        j = i+1;
        sum = sum+A(i,j)*xsolold(j);
        xsol(i) = (b(i)-sum)/A(i,i);
    end
    i=N;
    sum=0;
    j=i-1;
    sum = sum+A(i,j)*xsolold(j);
    xsol(i) = (b(i)-sum)/A(i,i);
end
% 2-norm of solution