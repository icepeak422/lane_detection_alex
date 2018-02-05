imagefiles = dir('compress_w1/*.png');      
nfiles = length(imagefiles);    % Number of files found
num_slice = nfiles;
gt_x =zeros(num_slice,6);
gt_y =zeros(num_slice,6);
for ii=1:num_slice
    currentfilename =  strcat('compress_w1/',imagefiles(ii).name);
    disp(currentfilename)
    disp(ii)
    imshow(currentfilename,'InitialMagnification',200);
    [gt_x(ii,:),gt_y(ii,:)]=getpts;
end
gt=cat(2,gt_x,gt_y);
