function DrawCraftingInterface(){
	xMidpoint = camera_get_view_width(view_camera[0])/2;
	yMidpoint = camera_get_view_height(view_camera[0])/2;
	baseScale = 2;
	iconScale = 1.5;
	margin = 2;
	slotSize = 20;
	iconSize = 16;

	iconAdjust = 2;

	inventory = oPlayer.inventory;
	inventoryPosX = 10;
	inventoryPosY = 300;
	inventoryRows = 1;
	inventoryColumns = 1;
	inventoryWidth = inventoryColumns * slotSize * baseScale + (inventoryColumns + 1)*margin;
	inventoryHeight = inventoryRows * slotSize * baseScale + (inventoryRows + 1)*margin;
	
	draw_sprite_stretched_ext(sGreyFrame, 0, inventoryPosX, inventoryPosY, inventoryWidth, inventoryHeight, c_white, .75);
	for (var i = 0; i < inventoryRows; i++) {
		for (var j = 0; j < inventoryColumns; j++) {
			_y = inventoryPosY + (i + 1) * margin + i*slotSize*baseScale;
			_x = inventoryPosX + (j + 1) * margin + j*slotSize*baseScale;
			draw_sprite_stretched_ext(sGreyFrame, 0, _x, _y, slotSize*baseScale, slotSize*baseScale, c_white, .75);
			inventorySlot = 10*i + j;
			slot = recipes[inventorySlot];
			interfaceSprite = slot.output[0]._item.sprite;
			_xx = _x + iconAdjust * baseScale;
			_yy = _y + iconAdjust * baseScale;
			draw_sprite_stretched(interfaceSprite, 0, _xx, _yy, 16*baseScale, 16*baseScale);
		}
	}
}