% main function for problem 2

fry = [0, pi/12, pi/8, pi/6, pi/4, pi/2, pi, 1.5*pi];

s = rand(3,1)

p0 = rand(3,1)

% plot the axis
quiver3(0, 0, 0, s(1), s(2), s(3));
hold on
plot3(p0(1), p0(2), p0(3), '*')

for i = 1:1:8
   R = R_solve(s, fry(i));
   p1 = R*p0;
   plot3(p1(1), p1(2), p1(3), 'ro')
    
end

