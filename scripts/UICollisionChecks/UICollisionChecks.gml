function CheckInventory(){
	with(oUIRenderer) {
		guiX = device_mouse_x_to_gui(0);
		guiY = device_mouse_y_to_gui(0);

		topX = inventoryPosX;
		topY = inventoryPosY;
		botX = inventoryPosX + inventoryWidth;
		botY = inventoryPosY + inventoryHeight;

		if (point_in_rectangle(guiX, guiY, topX, topY, botX, botY)) {
			for (var i = 0; i < inventoryRows; i++) {
				for (var j = 0; j < inventoryColumns; j++) {
					var _y = 10 + (i + 1) * margin + i*slotSize*baseScale;
					var _x = 10 + (j + 1) * margin + j*slotSize*baseScale;
					if (point_in_rectangle(guiX, guiY, _x, _y, _x + slotSize*baseScale, _y + slotSize*baseScale)) {
						hoveringSlot = 10*i + j;
						return true;
					}
				}
			}
			return true;
		} else {
			hoveringSlot = noone;
			return false;
		}	
	}
}

function CheckCraftingInterface(currentInstance) {
	with(currentInstance) {
		guiX = device_mouse_x_to_gui(0);
		guiY = device_mouse_y_to_gui(0);

		topX = inventoryPosX;
		topY = inventoryPosY;
		botX = inventoryPosX + inventoryWidth;
		botY = inventoryPosY + inventoryHeight;
		
		if (point_in_rectangle(guiX, guiY, topX, topY, botX, botY)) {
			for (var i = 0; i < inventoryRows; i++) {
				for (var j = 0; j < inventoryColumns; j++) {
					var _y = inventoryPosY + (i + 1) * margin + i*slotSize*baseScale;
					var _x = inventoryPosX + (j + 1) * margin + j*slotSize*baseScale;
					if (point_in_rectangle(guiX, guiY, _x, _y, _x + slotSize*baseScale, _y + slotSize*baseScale)) {
						hoveringSlot = 10*i + j;
						return true;
					}
				}
			}
			return true;
		} else {
			hoveringSlot = noone;
			return false;
		}	
		
		
	}
}