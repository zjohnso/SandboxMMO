destinationInstance = oPlayer.destinationInstance;

if (CheckInventory()) {
	mouseState = MOUSE_STATE.IN_INVENTORY;
	return;
}
if (destinationInstance != noone) {
	if (object_is_ancestor(destinationInstance.object_index, poWorkbench)) {
		if(CheckCraftingInterface(destinationInstance)) {
			mouseState = MOUSE_STATE.IN_CRAFTING;
			return;
		}
	}
} 
mouseState = MOUSE_STATE.IN_WORLD;	