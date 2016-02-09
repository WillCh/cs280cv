function res = combineImage(background, smaller)

%combine 2 ims
res = zeros(size(background,1),size(background,2),size(background,3));

    
for k = 1:1:size(res,3)
    for i = 1:1:size(res,1)
        for j = 1:1:size(res,2)
            %num = 1;
            %val = im(i,j,k,1);
            if (smaller(i, j, k) ~= 0)
                res(i,j,k) = smaller(i, j, k);
            else
                res(i,j,k) = background(i,j,k);
        end
    end
end


end