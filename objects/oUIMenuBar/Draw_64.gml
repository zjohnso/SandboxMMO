draw_set_alpha(.75);
var spriteIndex = 0;
if (menu_hovering) {
	spriteIndex = 1;	
}
draw_sprite_stretched(sGreyFrame, spriteIndex, menuPosX, menuPosY, menuWidth, menuHeight);
draw_set_alpha(1);
var iconX = menuPosX + menuMargin*baseScale;
var iconY = menuPosY + menuMargin*baseScale;
draw_sprite_stretched(sInventoryIcon, 0, iconX, iconY, menuItemSize * baseScale, menuItemSize * baseScale);