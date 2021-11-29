xMidpoint = camera_get_view_width(view_camera[0])/2;
yMidpoint = camera_get_view_height(view_camera[0])/2;
baseScale = 2;
iconScale = 1.5;
margin = 2;
slotSize = 20;
iconSize = 16;

iconAdjust = 2;

inventory = oPlayer.inventory;
inventoryPosX = 10;
inventoryPosY = 10;
inventoryRows = 5;
inventoryColumns = 10;
inventoryWidth = inventoryColumns * slotSize * baseScale + (inventoryColumns + 1)*margin;
inventoryHeight = inventoryRows * slotSize * baseScale + (inventoryRows + 1)*margin;




hoveringSlot = noone;
draggingSlot = noone;
