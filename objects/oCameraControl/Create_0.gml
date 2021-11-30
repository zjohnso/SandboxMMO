#macro MAX_ZOOM 4
#macro MIN_ZOOM .25

zoom = 4;
idealW = display_get_width()/zoom;
idealH = display_get_height()/zoom;

camZoomScale = 1;

surface_resize(application_surface, idealW, idealH);
//display_set_gui_size(window_get_width(), window_get_height());

window_set_size(idealW * 3, idealH * 3);

camera = camera_create();
camera_set_view_size(camera, idealW, idealH);

