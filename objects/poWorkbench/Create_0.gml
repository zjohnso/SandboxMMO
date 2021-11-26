/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
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
