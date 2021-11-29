function DrawCraftingInterface(currentWorkbench){
	with(currentWorkbench) {
		draw_sprite_stretched_ext(sGreyFrame, 0, inventoryPosX, inventoryPosY, inventoryWidth, inventoryHeight, c_white, .75);
		for (var i = 0; i < inventoryRows; i++) {
			for (var j = 0; j < inventoryColumns; j++) {
				_y = inventoryPosY + (i + 1) * margin + i*slotSize*baseScale;
				_x = inventoryPosX + (j + 1) * margin + j*slotSize*baseScale;
				inventorySlot = 10*i + j;
				var frameSpriteIndex = 0;
				if (inventorySlot == hoveringSlot) {
					frameSpriteIndex = 1;
				}
				draw_sprite_stretched_ext(sGreyFrame, frameSpriteIndex, _x, _y, slotSize*baseScale, slotSize*baseScale, c_white, .75);
				var slot = recipes[inventorySlot];
				interfaceSprite = slot.output[0].item.sprite;
				_xx = _x + iconAdjust * baseScale;
				_yy = _y + iconAdjust * baseScale;
				draw_sprite_stretched(interfaceSprite, 0, _xx, _yy, 16*baseScale, 16*baseScale);
			}
		}
	}
}