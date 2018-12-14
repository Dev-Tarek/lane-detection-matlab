function [ frame ] = Draw4( frame,offset,height,width )

   frame = insertShape(frame, 'Line', [width/2 height*6/7 width/2 height*2/3], 'LineWidth', 2, 'Color', 'blue'); 
   if(offset>0)
        frame = insertShape(frame, 'Line', [width/2 height*2/3 width*0.55 height*2/3], 'LineWidth', 2, 'Color', 'blue'); 
        frame = insertShape(frame, 'Line', [width*0.55 height*2/3 width*0.55-20 height*2/3-20], 'LineWidth', 2, 'Color', 'blue'); 
        frame = insertShape(frame, 'Line', [width*0.55 height*2/3 width*0.55-20 height*2/3+20], 'LineWidth', 2, 'Color', 'blue'); 
   else
        frame = insertShape(frame, 'Line', [width/2 height*2/3 width*0.45 height*2/3], 'LineWidth', 2, 'Color', 'blue'); 
        frame = insertShape(frame, 'Line', [width*0.45 height*2/3 width*0.45+20 height*2/3+20], 'LineWidth', 2, 'Color', 'blue'); 
        frame = insertShape(frame, 'Line', [width*0.45 height*2/3 width*0.45+20 height*2/3-20], 'LineWidth', 2, 'Color', 'blue'); 
   end
end

