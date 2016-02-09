function res = imwarped(im, H,w,h)

%p' = Hp;
H_re = inv(H);

res = zeros(h,w, size(im,3));
pnt = zeros(size(res,1)*size(res,2),3);
pnt_new = pnt;
k = 1;
for i = 1:1:size(res,1)
    for j = 1:1:size(res,2)
        pnt(k,1) = j;
        pnt(k,2) = i;
        pnt(k,3) = 1;
        k = k+1;
    end
end

pnt_new = H_re*pnt';
pnt_new = pnt_new';
pnt_new(:,1) = pnt_new(:,1)./pnt_new(:,3);
pnt_new(:,2) = pnt_new(:,2)./pnt_new(:,3);

for k = 1:1:size(im,3)
    val = interp2(im(:,:,k),pnt_new(:,1),pnt_new(:,2));
    cont = 1;
    for i = 1:1:size(res,1)
        for j = 1:1:size(res,2)
            if (val(cont) <= 10 && val(cont) >= -10)
                res(i,j,k) = val(cont);
            else 
                res(i,j,k) = 0;
            end
            cont = cont+1;
        end
    end
end

end