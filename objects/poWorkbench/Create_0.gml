event_inherited();

switch (image_angle) {
	case 0:
		cartX = x + 8;
		cartY = y + 8;
		break;
	case 90:
		cartX = x + 8;
		cartY = y + 8 + -16;
		break;
	case 180: 
		cartX = x + 8 + -16;
		cartY = y + 8 + -16;
		break;
	case 270:
		cartX = x + 8 + -16;
		cartY = y + 8;
		break;
}

drawX = ToIsoX(cartX, cartY);
drawY = ToIsoY(cartX, cartY, 0);


recipes = noone;


// UI Declarations
xMidpoint = camera_get_view_width(view_camera[0])/2;
yMidpoint = camera_get_view_height(view_camera[0])/2;
baseScale = 2;
iconScale = 1.5;
margin = 2;
slotSize = 20;
iconSize = 16;

iconAdjust = 2;

inventory = oPlayer.inventory;
inventoryPosX = drawX + 16;
inventoryPosY = drawY - 16;
posX = inventoryPosX;
posY = inventoryPosY;
inventoryRows = 1;
inventoryColumns = 1;
inventoryWidth = inventoryColumns * slotSize * baseScale + (inventoryColumns + 1)*margin;
inventoryHeight = inventoryRows * slotSize * baseScale + (inventoryRows + 1)*margin;


// UI Dynamic Declarations
hoveringSlot = noone;