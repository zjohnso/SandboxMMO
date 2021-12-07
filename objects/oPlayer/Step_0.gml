
if (isMoving) {
	drawX = ToIsoX(x, y);
	drawY = ToIsoY(x, y, 0);
}

if path_position == 1 {
	isMoving = false;
	if (destinationInstance != noone) {
		destinationInstance.playerInteracting = true;	
	}
}



// temp for fun REMOVE LATER
hasSantaHat = (inventory.GetTotalQuantity(ITEM_ID.SANTA_HAT) > 0);
