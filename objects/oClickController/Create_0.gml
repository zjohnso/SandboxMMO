enum MOUSE_STATE {
	IN_WORLD,
	IN_INV,
	IN_CRAFT,
	IN_MENU_BAR,
}
globalvar mouseState;
mouseState = MOUSE_STATE.IN_WORLD;