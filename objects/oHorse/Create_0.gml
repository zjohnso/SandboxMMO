/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

x_tile_init = CartToTileX(x);
y_tile_init = CartToTileY(y);

max_radius = 100;

sprite = sHorse;

isMoving = false;

prevPosX = drawX;
prevPosY = drawY;

horseSpeed = 0.1;

// direction -1 is left and 1 is right
_direction = 0;

event = irandom_range(0, 5) * room_speed * 10;

tamed = false;