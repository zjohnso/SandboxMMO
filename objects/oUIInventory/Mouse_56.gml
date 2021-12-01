if (inside) {
	if (hoveringSlot != noone && draggingSlot != noone) {
		inventory.SwapSlots(draggingSlot, hoveringSlot); 
	}	
} else {
	if (mouseState == MOUSE_STATE.IN_INV) {
		mouseState = MOUSE_STATE.IN_WORLD;	
	}
}

draggingSlot = noone;