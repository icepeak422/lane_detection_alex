originalConvNet = alexnet;
% Extract layers from the original network
layers = originalConvNet.Layers;

% Net surgery
% Replace the last few fully connected layers with suitable size layers
layers(20:25) = [];
outputLayers = [ ...
fullyConnectedLayer(16, 'Name', 'fcLane1');
reluLayer('Name','fcLane1Relu');
fullyConnectedLayer(12, 'Name', 'fcLane2');
regressionLayer('Name','output')];
untrained_net = [layers; outputLayers];

%%%%%%%%%%%%%%%%%%%%%----------training network---------%%%%%%%%%%%%%%%%%%%
Y=gt_c1w1;
num_slice = size(Y,1);
X=zeros(227,227,3,num_slice);
imagefiles = dir('compress_c1w1/*.png');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:num_slice
    currentfilename =  strcat('compress_c1w1/',imagefiles(ii).name);
    disp(currentfilename)
    X(:,:,:,ii)=imread(currentfilename);
end
[trainInd,valInd,testInd] = dividerand(num_slice,0.8,0.1,0.1);
trainX=X(:,:,:,trainInd);
targetY=Y(trainInd,:);
valX={X(:,:,:,valInd),Y(valInd,:)};
testX=X(:,:,:,testInd);
options = trainingOptions('sgdm',...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropFactor',0,...
    'InitialLearnRate',0.0000001,...
    'LearnRateDropPeriod',5,...
    'ValidationData',valX,...
    'ValidationFrequency',20,...
    'ValidationPatience' ,Inf,...
    'MaxEpochs',5,...
    'MiniBatchSize',3,...
    'Plots','training-progress');
rng('default')
trainedNet = trainNetwork(trainX,targetY,untrained_net,options);
Ypred = predict(trainedNet,testX);