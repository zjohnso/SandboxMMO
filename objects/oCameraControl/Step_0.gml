if (mouse_wheel_down()) {
	camZoomScale *= 2;	
} else if (mouse_wheel_up()) {
	camZoomScale *= .5;
}
camZoomScale = clamp(camZoomScale, MIN_ZOOM, MAX_ZOOM);