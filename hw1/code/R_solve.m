function R = R_solve(s, theta)
S = zeros(3,3);
S(1, 1:3) = [0, -s(3), s(2)];
S(2, 1:3) = [s(3), 0, -s(1)];
S(3, 1:3) = [-s(2), s(1), 0];

R = eye(3) + sin(theta) * S + (1 - cos(theta)) * S* S;


end