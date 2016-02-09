im1 = imread('photos/a5.jpg');
im1 = im2double(im1);
im2 = imread('photos/a3.jpg');
im2 = im2double(im2);
im2 = imresize(im2,0.2);
im1 = imresize(im1,0.2);
im3 = imread('photos/a1.jpg');
im3 = im2double(im3);
im3 = imresize(im3,0.2);

im2 = paddImage(im2, 3);

tmp = zeros(size(im2,1), size(im2,2), size(im2,3), 3);
tmp(:,:,:,1) = im2;


n = 8;
pntSet1 = getPntSet(im1, n);
pntSet2 = getPntSet(im2, n);
w = size(im2,2);
h = size(im2,1);
H = getH(pntSet1, pntSet2);
tmp(:,:,:,2) = imwarped(im1, H,w, h);
figure()
imshow(tmp(:,:,:,2))

% do for the another fig
pntSet1 = getPntSet(im3, n);
pntSet2 = getPntSet(im2, n);
H = getH(pntSet1, pntSet2);
tmp(:,:,:,3) = imwarped(im3, H,w, h);
figure()
imshow(tmp(:,:,:,3))

res = combineImage(tmp,false);
imshow(res);
figure();
res2 = parmidBlending(tmp);
imshow(res2);
figure();
res3 = normalBlending(tmp);
imshow(res3);

%%
clear
% do the 
im1 = imread('photos/a4.jpg');
im1 = im2double(im1);
im1 = imresize(im1,0.2);
n = 4;
pntSet1 = getPntSet(im1, n);
pntSet2 = getPntSet(im1, n);
w = size(im1,2);
h = size(im1,1);
H = getH(pntSet1, pntSet2);
res = imwarped(im1, H,w, h);
figure()
imshow(res)
%%
clear
im1 = imread('photos/chin2.jpg');
im1 = im2double(im1);
im2 = imread('photos/room.jpg');
im2 = im2double(im2);
im1 = imresize(im1,0.2);
im2 = imresize(im2,0.2);
n = 4;
pntSet1 = getPntSet(im1, n);
pntSet2 = getPntSet(im2, n);
w = size(im2,2);
h = size(im2,1);
H = getH(pntSet1, pntSet2);
im_new = imwarped(im1, H,w, h);


for k = 1:1:3
    for i = 1:1:h
        for j = 1:1:w
            if (im_new(i,j,k)> 1)
                im_new(i,j,k) = 1;
            elseif (im_new(i,j,k) < 0)
                im_new(i,j,k) = 0;
            end
            if (im2(i,j,k)> 1)
                im2(i,j,k) = 1;
            elseif (im2(i,j,k) < 0)
                im2(i,j,k) = 0;
            end
        end
    end
end

im_background = im2;
im_object = im_new;
    
    % get source region mask from the user
    objmask = getMask(im_object);
    % align im_s and mask_s with im_background
    [im_s, mask_s] = alignSource(im_object, objmask, im_background);

    % blend
    im_blend = poissonBlend(im_s, mask_s, im_background);
    figure(), hold off, imshow(im_blend)

