event_inherited();
inside = false;

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
baseScale = 2;
margin = 2;
slotSize = 20;
iconSize = 16;

iconAdjust = 2;
windowPosX = drawX + 16;
windowPosY = drawY - 16;
windowDrawPosX = windowPosX;
windowDrawPosY = windowPosY;
recipeRows = 1;
recipeColumns = 1;
windowWidth = recipeColumns * slotSize * baseScale + (recipeColumns + 1)*margin;
windowHeight = recipeRows * slotSize * baseScale + (recipeRows + 1)*margin;


// UI Dynamic Declarations
hoveringSlot = noone;