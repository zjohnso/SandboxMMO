x = oPlayer.drawX;
y = oPlayer.drawY;

var camW = window_get_width()/zoom;
var camH = window_get_height()/zoom;

camW *= camZoomScale;
camH *= camZoomScale;

var xOffset = camW/2;
var yOffset = camH/2;

camera_set_view_size(view_camera[0], camW, camH);
surface_resize(application_surface, window_get_width(), window_get_height());

display_set_gui_size(window_get_width(), window_get_height());

camera_set_view_pos(view_camera[0], x - xOffset, y - yOffset);
