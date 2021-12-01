if (playerInteracting) {
	var guiX = device_mouse_x_to_gui(0);
	var guiY = device_mouse_y_to_gui(0);

	var topX = windowDrawPosX;
	var topY = windowDrawPosY;
	var botX = windowDrawPosX + windowWidth;
	var botY = windowDrawPosY + windowHeight;
		
	if (point_in_rectangle(guiX, guiY, topX, topY, botX, botY)) {
		mouseState = MOUSE_STATE.IN_CRAFT;
		inside = true;
		for (var i = 0; i < recipeRows; i++) {
			for (var j = 0; j < recipeColumns; j++) {
				var _y = topY + (i + 1) * margin + i*slotSize*baseScale;
				var _x = topX + (j + 1) * margin + j*slotSize*baseScale;
				if (point_in_rectangle(guiX, guiY, _x, _y, _x + slotSize*baseScale, _y + slotSize*baseScale)) {
					hoveringSlot = 10*i + j;
				}
			}
		}
	} else {
		hoveringSlot = noone;
		inside = false;
		if (mouseState == MOUSE_STATE.IN_CRAFT) {
			mouseState = MOUSE_STATE.IN_WORLD;
		}
	}
}