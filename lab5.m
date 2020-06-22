D = 'D:\study\cbivr\lab5-histogram feature based cbir\50images';%GETTING THE PATH TO THE DIRECTORY%
S = dir(fullfile(D,'*.jpg'));%READING IMAGE NAMES%
qim=imread('D:\study\cbivr\lab5-histogram feature based cbir\50images\y4.jpg');
im1=rgb2gray(qim);
[count,bin]=imhist(im1);
info_table = cell2table(cell(0,3),'VariableNames',{'Imagename' 'count' 'ed' });
for k = 1:numel(S)
   clear F;
   clear I;
   F= fullfile(D,S(k).name);
   I= imread(F);
   testi=rgb2gray(I);
   [count1,bin1]=imhist(testi);
   ed=sqrt((count-count1).^2);
   
   new_row={S(k).name,count1,sum(ed)};
   info_table=[info_table;new_row];
 end
info_table=sortrows(info_table,'ed');
writetable(info_table,'HIST-DB.csv');
subplot(3,3,2);
imshow(qim);
title('Query Image');
file_names=info_table(:,'Imagename').Imagename;
%DISPLAYING THE TOP 6 IMAGES%
for k=1:6
    F=fullfile(D,char(file_names(k)));
    I=imread(F);
    subplot(3,3,k+3);
    imshow(I);
end
