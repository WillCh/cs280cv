function ans = affine_solve(u, v)

% assume v = Hu
N = size(u,1);

X = zeros(2*N, 6);
Y = zeros(2*N, 1);
for i = 1:1:N
    X(2*i - 1, :) = [u(i,1), u(i,2), 1, 0, 0, 0];
    Y(2*i - 1) = v(i, 1);
    X(2*i, :) = [0, 0, 0, u(i, 1), u(i, 2), 1];
    Y(2*i) = v(i, 2);
end

% do Linear regression here
% Y = X*beta
beta = inv(X.'*X)*(X.')*Y;

ans = zeros(3,3);
ans(1, :) = [beta(1), beta(2), beta(3)];
ans(2, :) = [beta(4), beta(5), beta(6)];
ans(3, :) = [0, 0, 1];

end