# lane_detection_alex
## Download the dataset
The dataset is from Caltech website: http://www.mohamedaly.info/datasets/caltech-lanes
## dl_alexnet
I choose alexnet from matlab nerual network tool box to finish this task. Here I have to modify the structure of alexnet.

```% Replace the last few fully connected layers with suitable size layers
layers(20:25) = [];
outputLayers = [ ...
fullyConnectedLayer(16, 'Name', 'fcLane1');
reluLayer('Name','fcLane1Relu');
fullyConnectedLayer(12, 'Name', 'fcLane2');
regressionLayer('Name','output')];
untrained_net = [layers; outputLayers];
```


## How to deal with the raw image
First, compress the image to 227x227x3 using image_compress.m which is the input of alexnet.

Second, open labeler.m to label the image, we initially label three points for each lane. When you are labeling different folder, remember to change the directory's name.

Here I have already labeled two folder: cordova1 and washington1, the ground truth label all in gt_c1w1.m file.

## Train the alexnet

1. Divide the whole dataset to different poportion to train, validate, and test the network

```
[trainInd,valInd,testInd] = dividerand(num_slice,0.8,0.1,0.1);
```

 2.run train_dl_network.m to see the training process.
 
 ## Test the alexnet
run test_dl.m to see the network performance on testset. the little red line on the right is the part of the ground truth of the image.

![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Trained by 587 images")
