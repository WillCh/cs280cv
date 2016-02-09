function H = homography_solve(u,v)

% v = H u
N = size(u,1);

X = zeros(2*N, 8);
Y = zeros(2*N, 1);
for i = 1:1:N
    X(2*i - 1, :) = [u(i,1), u(i,2), 1, 0, 0, 0, -u(i, 1) * v(i,1), -u(i,2)*v(i,1)];
    Y(2*i - 1) = v(i, 1);
    X(2*i, :) = [0, 0, 0, u(i, 1), u(i, 2), 1, -u(i,1)*v(i,2), -u(i,2)*v(i,2)];
    Y(2*i) = v(i, 2);
end

% do Linear regression here
% Y = X*beta
beta = inv(X.'*X)*(X.')*Y;

H = zeros(3,3);
H(1, :) = [beta(1), beta(2), beta(3)];
H(2, :) = [beta(4), beta(5), beta(6)];
H(3, :) = [beta(7), beta(8), 1];


end