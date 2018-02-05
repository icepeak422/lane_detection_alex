imagefiles = dir('compress_c1w1/*.png');  
for ii=1:size(testInd,2)
    figure
    currentfilename =  strcat('compress_c1w1/',imagefiles(testInd(ii)).name);
    imshow(currentfilename,'InitialMagnification',200);
    line([gt_c1w1(testInd(ii),4),gt_c1w1(testInd(ii),5)],[gt_c1w1(testInd(ii),10),gt_c1w1(testInd(ii),11)],'Color','r','LineWidth',2);
    line([Ypred(ii,1),Ypred(ii,2)],[Ypred(ii,7),Ypred(ii,8)],'Color','r','LineWidth',2);
    line([Ypred(ii,2),Ypred(ii,3)],[Ypred(ii,8),Ypred(ii,9)],'Color','r','LineWidth',2);
    line([Ypred(ii,4),Ypred(ii,5)],[Ypred(ii,10),Ypred(ii,11)],'LineWidth',2);
    line([Ypred(ii,5),Ypred(ii,6)],[Ypred(ii,11),Ypred(ii,12)], 'LineWidth',2);
    hold on;
end
