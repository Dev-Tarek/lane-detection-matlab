%% TEAM MEMBERS:
% Abdelrahman Hamdy Metwally
% Abdelrahman Tarek Abdelhamid
% Ahmed Elsaid Bally
% Mona Mardy Elaraby
% Yasmin Ahmed Barakat
%% SUPERVISION: DR. MAHMOUD ALSHWEIMY

%% MAIN SCRIPT - START HERE

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