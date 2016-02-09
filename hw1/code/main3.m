% main func for the prob 3

% read the imgs
im1 = imread('../images/onePieceWanted.jpg');
im1 = im2double(im1);
im2 = imread('../images/VCL.jpg');
im2 = im2double(im2);

% for five surface
for s = 1:1:5
    % get the four key pnts
    
    n = 4;
    pntSet1 = getPntSet(im1, n);
    pntSet2 = getPntSet(im2, n);
    w = size(im2,2);
    h = size(im2,1);
    H = homography_solve(pntSet1, pntSet2);
    % H = affine_solve(pntSet1, pntSet2);
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

    im2 = combineImage(im2, im_new);

    imshow(im2);
end
