# lane_detection_alex
## Download the dataset
The dataset is from Caltech website: http://www.mohamedaly.info/datasets/caltech-lanes
## dl_alexnet
I choose alexnet from matlab nerual network tool box to finish this task. Here I have to modify the structure of alexnet.

% Replace the last few fully connected layers with suitable size layers
layers(20:25) = [];
outputLayers = [ ...
fullyConnectedLayer(16, 'Name', 'fcLane1');
reluLayer('Name','fcLane1Relu');
fullyConnectedLayer(12, 'Name', 'fcLane2');
regressionLayer('Name','output')];
untrained_net = [layers; outputLayers];


## How to deal with the raw image
First compress the image to 227x227x3 using image_compress.m which is the input of alexnet.

Second open labeler.m to label the image, we initially label three points for each lane. When you are labeling different folder, remember to change the directory's name.

Here I have already labeled two folder: cordova1 and washington1, the ground truth label all in gt_c1w1.m file.
## Train the alexnet
