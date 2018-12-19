
%%
figure, imshow(actual_image), hold, DrawLines(detectedLines)

%%
figure
subplot(2,2,1)
imshow(grayImage)
subplot(2,2,2)
imshow(maskedImage)
subplot(2,2,3)
imshow(blurImage)
subplot(2,2,4)
imshow(edgesImage)