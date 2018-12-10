%% PROJECT CODE

%imagePath = 'test_images/lane.jpeg';
%image = imread(imagePath);

videoPath = 'test_videos/challenge.mp4';
video = VideoReader(videoPath);

LaneDetection(video);