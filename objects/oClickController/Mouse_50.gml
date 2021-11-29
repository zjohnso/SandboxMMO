switch mouseState {
	case MOUSE_STATE.IN_INVENTORY:
		with(oUIRenderer) {
			if (draggingSlot == noone && inventory.items_list[hoveringSlot].item != noone) {
				draggingSlot = hoveringSlot;
			}
		}
		break;
}