function v = homography_transform(u,H)
N = size(u,2);
u_new = ones(3, N);
u_new(1:2, :) = u;
v_new = H*u_new;

v(1,:) = v_new(1,:)./v_new(3,:);
v(2,:) = v_new(2,:)./v_new(3,:);
