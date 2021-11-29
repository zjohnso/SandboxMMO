switch mouseState {
	case MOUSE_STATE.IN_INVENTORY:
		with(oUIRenderer) {
			if (hoveringSlot != noone && draggingSlot != noone) {
				inventory.SwapSlots(draggingSlot, hoveringSlot); 
			}
			draggingSlot = noone;
		}
		break;
	case MOUSE_STATE.IN_WORLD:
		oUIRenderer.draggingSlot = noone;
		break;
}