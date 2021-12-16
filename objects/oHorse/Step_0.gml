/// @description Insert description here
// You can write your code in this editor

if event >= (room_speed * 5) * 10 {
	HandleHorseMovement();
	event = 0;
}

if CartToTileX(oPlayer.x) == CartToTileX(x) and CartToTileY(oPlayer.y) == CartToTileY(y) {
	tamed = true;
}

event++;

if (isMoving) {
	drawX = MobToIsoX(x, y);
	drawY = MobToIsoY(x, y, 0);
	
	// get the direction travelling
	if (drawX <= prevPosX) {
		_direction = -1;	
	} else {
		_direction = 1;	
	}
	
	prevPosX = drawX;
	prevPosY = drawY;
}

if path_position == 1 {
	isMoving = false;
}