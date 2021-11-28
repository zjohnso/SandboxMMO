switch mouseState {
	case MOUSE_STATE.IN_WORLD:
		HandlePlayerMovement();
	break;
	case MOUSE_STATE.IN_UI:
		// do ui stuff
	break;
}