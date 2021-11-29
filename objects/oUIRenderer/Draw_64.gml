draw_sprite_stretched_ext(sGreyFrame, 0, inventoryPosX, inventoryPosY, inventoryWidth, inventoryHeight, c_white, .75);
for (var i = 0; i < inventoryRows; i++) {
	for (var j = 0; j < inventoryColumns; j++) {
		_y = 10 + (i + 1) * margin + i*slotSize*baseScale;
		_x = 10 + (j + 1) * margin + j*slotSize*baseScale;
		inventorySlot = 10*i + j;
		frameSpriteIndex = 0;
		if (hoveringSlot == inventorySlot) {
			frameSpriteIndex = 1;	 
		}
		draw_sprite_stretched_ext(sGreyFrame, frameSpriteIndex, _x, _y, slotSize*baseScale, slotSize*baseScale, c_white, .75);
		slot = inventory.items_list[inventorySlot];
		if (slot.item != noone) {
			sprite = slot.item.sprite;
			quantity = slot.quantity;
			_xx = _x + iconAdjust * baseScale;
			_yy = _y + iconAdjust * baseScale;
			var _alpha = 1;
			if (inventorySlot == draggingSlot) {
				_alpha = .5;	
			}
			draw_set_alpha(_alpha)
			draw_sprite_stretched(sprite, 0, _xx, _yy, 16*baseScale, 16*baseScale);
			draw_text(_xx, _yy, quantity);
			draw_set_alpha(1);
		}
	}
}

if (draggingSlot != noone) {
	var guiX = device_mouse_x_to_gui(0);
	var guiY = device_mouse_y_to_gui(0);
	
	var drawX = guiX - (16*baseScale)/2;
	var drawY = guiY - (16*baseScale)/2;
	
	var slot = inventory.items_list[draggingSlot];
	
	draw_sprite_stretched(slot.item.sprite, 0, drawX, drawY, 16*baseScale, 16*baseScale);
	draw_text(drawX, drawY, slot.quantity);
}


