switch mouseState {
	case MOUSE_STATE.IN_UI:
		with(oUIRenderer) {
			if (hoveringSlot != noone) {
				inventory.SwapSlots(draggingSlot, hoveringSlot); 
			}
			draggingSlot = noone;
		}
		break;
	case MOUSE_STATE.IN_WORLD:
		oUIRenderer.draggingSlot = noone;
		break;
}