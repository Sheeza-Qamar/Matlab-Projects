clearvars;

A = zeros(200, 200);

cx = 100;
cy = 100;
rad = 20;

for i = 1:1:200
    for j = 1:1:200
        if max(abs(i - cx), abs(j - cy)) <= rad
            A(i, j) = 255;
        end
    end
end

imshow(A);
