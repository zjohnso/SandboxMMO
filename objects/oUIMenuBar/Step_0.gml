var guiX = device_mouse_x_to_gui(0);
var guiY = device_mouse_y_to_gui(0);
		
var topX = menuPosX;
var topY = menuPosY;
var botX = menuPosX + menuWidth;
var botY = menuPosX + menuHeight;
		
if (point_in_rectangle(guiX, guiY, topX, topY, botX, botY)) {
	menu_hovering = true;
	mouseState = MOUSE_STATE.IN_MENU_BAR;
} else {
	menu_hovering = false;
	if (mouseState == MOUSE_STATE.IN_MENU_BAR) {
		mouseState = MOUSE_STATE.IN_WORLD;	
	}
}