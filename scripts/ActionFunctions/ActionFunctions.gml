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
		newPath = path_add();

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
			
			// generate a path that will honor grid based movement
			var lastPointX = -1;
			var lastPointY = -1;
			for (var i = 0; i < path_get_number(path); i++) {
				var pointX = path_get_point_x(path, i);
				var pointY = path_get_point_y(path, i);
				var pointTileX = floor(pointX div TILE_H);
				var pointTileY = floor(pointY div TILE_H);
				if (pointTileX != lastPointX || pointTileY != lastPointY) {
					path_add_point(newPath, pointTileX * TILE_H + TILE_H/2, pointTileY * TILE_H + TILE_H/2, 100);
					lastPointX = pointTileX;
					lastPointY = pointTileY;
				}
			}
			// set the path to not return to start
			path_set_closed(newPath, false);
	
			isMoving = true;
			destinationX = ToIsoX(targetX, targetY);
			destinationY = ToIsoY(targetX, targetY, 0);
		    path_start(newPath, 1, path_action_stop, true);	
		}

		if (removedCell) {
			mp_grid_add_cell(grid, targetTileX, targetTileY);
			removedCell = false;
		}
	}
}

function CraftItem(recipe) {
	var input = recipe.input;
	var output = recipe.output;
	
	// check player has necessary items
	for (var i = 0; i < array_length(input); i++) {
		var itemID = input[i].item._id;
		var quantity = input[i].quantity;
		if (oPlayer.inventory.GetTotalQuantity(itemID) < quantity) {
			return false;	
		}
	}
	
	// remove input items
	for (var i = 0; i < array_length(input); i++) {
		var itemID = input[i].item._id;
		var quantity = input[i].quantity;
		oPlayer.inventory.RemoveItem(itemID, quantity)
	}
	
	// add output items
	for (var i = 0; i < array_length(output); i++) {
		var item = output[i].item;
		var quantity = output[i].quantity;
		oPlayer.inventory.AddItem(item, quantity)
	}
	return true;
}