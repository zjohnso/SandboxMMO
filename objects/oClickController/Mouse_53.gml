switch mouseState {
	case MOUSE_STATE.IN_WORLD:
		HandlePlayerMovement();
		break;
	case MOUSE_STATE.IN_INVENTORY:
		// do ui stuff
		break;
	case MOUSE_STATE.IN_CRAFTING:
		with(destinationInstance) {
			CraftItem(recipes[hoveringSlot]);
		}
		break;
}