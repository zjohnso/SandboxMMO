x = oPlayer.drawX;
y = oPlayer.drawY;

var camW = window_get_width()/zoom;
var camH = window_get_height()/zoom;

camW *= camZoomScale;
camH *= camZoomScale;

var xOffset = camW/2;
var yOffset = camH/2;

show_debug_message("cam Pos: " + string(x - xOffset) + ", " + string(y - yOffset));
show_debug_message("cam Dims: " + string(camW) + ", " + string(camH));
show_debug_message("cam aspect: " + string(camW/camH));
show_debug_message("window aspect: " + string(window_get_width()/window_get_height()));

camera_set_view_size(view_camera[0], camW, camH);
surface_resize(application_surface, window_get_width(), window_get_height());

display_set_gui_size(window_get_width(), window_get_height());

camera_set_view_pos(view_camera[0], x - xOffset, y - yOffset);
