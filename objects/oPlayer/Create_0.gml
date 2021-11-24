enum destination {
	node,
	tile,
};

globalvar grid;
grid = mp_grid_create(0,0,room_width div 16, room_height div 16, 16, 16);
mp_grid_add_instances(grid, oCollider, false);

inventory = new Inventory();

logs = 0;

destinationInstance = noone;

isMoving = false;
destinationType = destination.tile;

targetX = 100;
targetY = 100;

destinationX = 0;
destinationY = 0;


y -= 8
x -= 8

drawX = ToIsoX(x, y);
drawY = ToIsoY(x, y, 0);