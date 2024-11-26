function x = tdma(L, D, R, B)
    N = length(B);       % Number of equations
    % Forward elimination
    for i = 2:N
        m = L(i-1) / D(i-1);
        D(i) = D(i) - m * R(i-1);
        B(i) = B(i) - m * B(i-1);
    end

    % Back substitution
    x = zeros(N, 1);
    x(N) = B(N) / D(N);
    for i = N-1:-1:1
        x(i) = (B(i) - R(i) * x(i+1)) / D(i);
    end
end