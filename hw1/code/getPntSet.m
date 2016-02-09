function pntSet = getPntSet(im, n)
disp('choose the key pnt')
%figure(), hold off, imagesc(im), axis image
figure(), hold off, imshow(im), axis image
%pntSet = zeros(n,2);
for i = 1:1:n
    %figure(1);
    [x, y, b] = ginput(1);
    if b=='q'
        break;
    end
    pntSet(i,1) = x;
    pntSet(i,2) = y;
    hold on, plot(pntSet(1:i,1), pntSet(1:i,2), '*-');
    
end

end