if (playerInteracting) {
	var scaleFactor = oCameraControl.zoom / oCameraControl.camZoomScale;
	windowDrawPosX = (windowPosX - camera_get_view_x(view_camera[0])) * scaleFactor;
	windowDrawPosY = (windowPosY - camera_get_view_y(view_camera[0])) * scaleFactor;
	draw_sprite_stretched_ext(sGreyFrame, 0, windowDrawPosX, windowDrawPosY, windowWidth, windowHeight, c_white, .75);
	for (var i = 0; i < recipeRows; i++) {
		for (var j = 0; j < recipeColumns; j++) {
			var _y = windowDrawPosY + (i + 1) * margin + i*slotSize*baseScale;
			var _x = windowDrawPosX + (j + 1) * margin + j*slotSize*baseScale;
			var recipeSlot = 10*i + j;
			var frameSpriteIndex = 0;
			if (recipeSlot == hoveringSlot) {
				frameSpriteIndex = 1;
			}
			draw_sprite_stretched_ext(sGreyFrame, frameSpriteIndex, _x, _y, slotSize*baseScale, slotSize*baseScale, c_white, .75);
			var slot = recipes[recipeSlot];
			var interfaceSprite = slot.output[0].item.sprite;
			var _xx = _x + iconAdjust * baseScale;
			var _yy = _y + iconAdjust * baseScale;
			draw_sprite_stretched(interfaceSprite, 0, _xx, _yy, 16*baseScale, 16*baseScale);
		}
	}
}