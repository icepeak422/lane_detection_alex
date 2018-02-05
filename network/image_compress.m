clear all
imagefiles = dir('washington2/*.png');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename =  strcat('washington2/',imagefiles(ii).name);
   disp(currentfilename)
   im = imread(currentfilename);
   im = imresize(im,[227 227]);
   Resultados = 'C:\Users\hang.ren\Desktop\lane detection\labeling\compress_w2';
   baseFileName = sprintf('%d.png',ii); % e.g. "1.png"
    fullFileName = fullfile(Resultados, baseFileName); % No need to worry about slashes now!
    imwrite(im, fullFileName);
end