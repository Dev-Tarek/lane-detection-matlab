%% PROJECT CODE

%imagePath = 'test_images/lane.jpeg';
%image = imread(imagePath);

videoPath = 'test_videos/solidwhiteright.mp4';
video = VideoReader(videoPath);

videoSource = vision.VideoFileReader(videoPath);
depVideoPlayer = vision.DeployableVideoPlayer();

while ~isDone(videoSource)
      frame = single2uint8(step(videoSource));
      frame = LaneDetection(frame);
      step(depVideoPlayer, frame);
end

release(videoPlayer);
release(videoSource);

%LaneDetection(video);