targetX = mouse_x;
targetY = mouse_y;
targetTileX = ScreenXToTile(targetX, targetY);
targetTileY = ScreenYToTile(targetX, targetY);

// cancel any action about to happen
if (destinationInstance != noone) {
	destinationInstance.playerHarvesting = false;
	destinationInstance = noone;
}

targetX = targetTileX * 16;
targetY = targetTileY * 16;

targetX += 8;
targetY += 8;

path = path_add();
if mp_grid_path(grid, path, x, y, targetX, targetY, 0) {
	
	// check for click on some object to interact with
	var inst;
	inst = instance_position(targetX, targetY, poObjects);
	// if there is some object, go touch it 
	if (inst != noone) { 
		// path to tile closest to object but not the object's tile
		path_delete_point(path, path_get_number(path) - 1);
		destinationInstance = inst;
	}
	
	isMoving = true;
	destinationX = ToIsoX(targetX, targetY);
	destinationY = ToIsoY(targetX, targetY, 0);
    path_start(path, 1, path_action_stop, 1);	
}