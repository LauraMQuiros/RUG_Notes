format long
clear all
for igrid=1:40
    N=2^igrid;
    h=1/N;
    res(igrid)=simp(0,pi,N);
    if igrid > 3
        q(igrid)=(res(igrid-2)-res(igrid-1))/(res(igrid-1)-res(igrid));
    else
        q(igrid)= 0;
    end
    errest(igrid)= 1/3*(res(igrid)-res(igrid-1));
    exerr(igrid)= res(igrid)-(exp(1)-1);
    fprintf('%6.0f,%15.6f,%15.6f, %15.6f, %15.6f \n', igrid, res(igrid), errest(igrid), exerr(igrid), q(igrid))
    if abs(errest(igrid)) < 1.0E-8
        break
    end
end
