# lane_detection_alex
## deep learning lane detection method using matlab nerual network toolbox.
## download the dataset
The dataset is from Caltech website: http://www.mohamedaly.info/datasets/caltech-lanes
## how to deal with the raw image
First compress the image to 227x227x3 using image_compress.m which is the input of alexnet.

Second open labeler.m to label the image, we initially label three points for each lane. When you are labeling different folder, remember to change the directory's name.

Here I have already labeled two folder, the ground truth label all in gt_c1w1.m file
