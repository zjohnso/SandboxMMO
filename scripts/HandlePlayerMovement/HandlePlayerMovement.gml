function HandlePlayerMovement(){
	with(oPlayer) {
		targetX = mouse_x;
		targetY = mouse_y;
		targetTileX = ScreenXToTile(targetX, targetY);
		targetTileY = ScreenYToTile(targetX, targetY);

		// cancel any action about to happen
		if (destinationInstance != noone) {
			destinationInstance.playerInteracting = false;
			destinationInstance = noone;
		}
	
		targetX = targetTileX * 16;
		targetY = targetTileY * 16;

		targetX += 8;
		targetY += 8;

		path = path_add();

		// check for click on some object to interact with
		var inst;
		inst = instance_position(targetX, targetY, poObjects);

		if (inst != noone) {
			mp_grid_clear_cell(grid, targetTileX, targetTileY);
			removedCell = true;
		}

		if mp_grid_path(grid, path, x, y, targetX, targetY, 0) {
	
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

		if (removedCell) {
			mp_grid_add_cell(grid, targetTileX, targetTileY);
			removedCell = false;
		}
	}
}