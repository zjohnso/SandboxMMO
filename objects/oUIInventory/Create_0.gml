show = false;
inside = false;

baseScale = 2;
margin = 2;
slotSize = 20;
iconSize = 16;

iconAdjust = 2;
inventory = oPlayer.inventory;
inventoryPosX = 10;
inventoryPosY = 60;
inventoryRows = 5;
inventoryColumns = 10;
inventoryWidth = inventoryColumns * slotSize * baseScale + (inventoryColumns + 1)*margin;
inventoryHeight = inventoryRows * slotSize * baseScale + (inventoryRows + 1)*margin;

hoveringSlot = noone;
draggingSlot = noone;