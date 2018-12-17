%% PROJECT CODE

%imagePath = 'test_images/lane.jpeg';
%image = imread(imagePath);

videoPath = 'test_videos/challenge.mp4';

videoSource = vision.VideoFileReader(videoPath);
depVideoPlayer = vision.DeployableVideoPlayer();

while ~isDone(videoSource)
      frame = single2uint8(step(videoSource));
      frame = LaneDetection(frame);
      step(depVideoPlayer, frame);
end

release(depVideoPlayer);
release(videoSource);

