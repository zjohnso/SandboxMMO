// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HandleHorseMovement(){
	with(oHorse) {
		

		if not tamed {
			r = random_range(0, max_radius);
			theta = random_range(0, 2*pi);
			
			targetTileX = x_tile_init + CartToTileX(r * cos(theta));
			targetTileY = y_tile_init + CartToTileY(r * sin(theta));
		}
		else {
			targetTileX = CartToTileX(oPlayer.x) - 1;
			targetTileY = CartToTileY(oPlayer.y) - 1;
		}
	
		targetX = targetTileX * 16;
		targetY = targetTileY * 16;

		targetX += 8;
		targetY += 8;

		path = path_add();
		newPath = path_add();

		if mp_grid_path(grid, path, x, y, targetX, targetY, 0) {
			
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
			destinationX = MobToIsoX(targetX, targetY);
			destinationY = MobToIsoY(targetX, targetY, 0);
		    path_start(newPath, horseSpeed, path_action_stop, true);	
		}
	}
}