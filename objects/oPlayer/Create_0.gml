inventory = new Inventory();
height = 16;

destinationInstance = noone;

isMoving = false;

targetX = 100;
targetY = 100;

destinationX = 0;
destinationY = 0;

removedCell = false;

y -= 8
x -= 8

drawX = ToIsoX(x, y);
drawY = ToIsoY(x, y, 0);


// temp for fun REMOVE LATER
hasSantaHat = (inventory.GetTotalQuantity(ITEM_ID.SANTA_HAT) > 0);