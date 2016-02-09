function [s,phi] = rot_to_ax_phi(R)
[V,D] = eig(R);
tr = 0;
s = zeros(3,1);
for i = 1:1:3
    if (abs(D(i,i)-1.0) < 1e-10)
       s = V(:,i);
    end
    tr = tr + D(i,i);
end
phi = acos(0.5*(tr - 1));
end
