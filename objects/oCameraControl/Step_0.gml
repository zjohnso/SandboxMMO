x = oPlayer.drawX;
y = oPlayer.drawY;

xOffset = camera_get_view_width(view_camera[0])/2;
yOffset = camera_get_view_height(view_camera[0])/2;

camera_set_view_pos(view_camera[0], x - xOffset, y - yOffset);