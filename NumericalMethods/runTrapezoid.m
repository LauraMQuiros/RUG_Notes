format long
clear all
for igrid=1:40
    N=2^igrid;
    h=1/N;
    res(igrid)=trapezoid(0,1,N);
    if igrid > 3
        q(igrid)=(res(igrid-2)-res(igrid-1))/(res(igrid-1)-res(igrid));
    else
        q(igrid)= 0;
    end
    if igrid > 2
        errest(igrid)= 1/3*(res(igrid)-res(igrid-1));
        extrap(igrid)= 4/3*res(igrid)- 1/3* res(igrid-1);
    else
        errest(igrid)= NaN;
        extrap(igrid)=NaN;
    end
    exerr(igrid)= res(igrid)-(exp(1)-1);
    fprintf('%6.0f,%15.6f,%15.6f, %15.6f, %15.6f, %15.6f \n', igrid, res(igrid), errest(igrid), exerr(igrid), q(igrid), extrap(igrid))
    if abs(errest(igrid)) < 1.0E-8
        break
    end
end
