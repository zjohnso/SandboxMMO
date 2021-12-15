// draws the ground and floor layer of the map
function DrawGroundAndFloorLayer(){
	for (var i = 0; i< MAP_W; i++) {
		for (var j = 0; j < MAP_H; j++) {
			var groundTileData = global.theMap[# i, j];
			var floorTileData = global.theFloorMap[# i, j];
		
			var roomX = TileToScreenX(i, j);
			var roomY = TileToScreenY(i, j);
		
			// get ground tile information
			var groundTileIndex = groundTileData[TILE.SPRITE];
			var groundTileZ = groundTileData[TILE.Z];
			
			// get floor tile information
			var floorTileIndex = floorTileData[TILE.SPRITE];
			var floorTileZ = floorTileData[TILE.Z];
		
			// render ground tile
			if (groundTileIndex != 0) {
				draw_sprite(sIsoGrass, groundTileIndex - 1, roomX, roomY - groundTileZ);
				if (groundTileIndex != 4) {
					draw_set_alpha(.85);
					draw_sprite(sIsoSnowDecor, 0, roomX, roomY - groundTileZ);
					draw_set_alpha(1);
				}
			}
			
			// render floor tile
			if (floorTileIndex != 0) {
				draw_sprite(sIsoInteriorFloors, floorTileIndex - 1, roomX, roomY - floorTileZ);
			}
		}
	}
}

// draws the roof layer of the map
function DrawRoofLayer() {
	if (global.drawRoof) {
		for (var i = 0; i< MAP_W; i++) {
			for (var j = 0; j < MAP_H; j++) {
				var tileData = global.theRoofMap[# i, j];
		
				var roomX = TileToScreenX(i, j);
				var roomY = TileToScreenY(i, j);
		
				var tileIndex = tileData[TILE.SPRITE];
				var tileZ = tileData[TILE.Z];
				
				var playerDrawXTile = ScreenXToTile(oPlayer.drawX, oPlayer.drawY);
				var playerDrawYTile = ScreenYToTile(oPlayer.drawX, oPlayer.drawY);
		
				if (tileIndex != 0) {
					var a = 1;
					if (i >= playerDrawXTile && i < playerDrawXTile + 3) {
						if (j >= playerDrawYTile && j < playerDrawYTile + 3) {
							a = .25;	
						}
					}
					draw_sprite_ext(sIsoRoof, tileIndex - 1, roomX, roomY + tileZ, 1, 1, 0, c_white, a);	
				}
			}
		}
	}	
}

function DrawPointer() {
	
	draw_sprite(sDestination, 0, oPlayer.destinationX, oPlayer.destinationY);	
}

function DrawPlayer() {
	draw_sprite(sPlayer, 0, oPlayer.drawX, oPlayer.drawY);
	// render the player's santa hat if has one TEMP REMOVE LATER
	if (oPlayer.hasSantaHat) {
		draw_sprite(sSantaHat, 0, oPlayer.drawX, oPlayer.drawY - oPlayer.height);	
	}	
}

function DrawWall(tileX, tileY, tileIndex, tileDrawX, tileDrawY, tileZ) {
	var a = 1;
	if (tileX >= oRenderer.playerDrawXTile && tileX < oRenderer.playerDrawXTile + 2) {
		if (tileY >= oRenderer.playerDrawYTile && tileY < oRenderer.playerDrawYTile + 2) {
			a = .25;	
		}
	}
	var wall = global.wallMapping[tileIndex - 1];
	var wallToDraw = wall.drawOrder[DRAW_ORDER.BACK_G];
	if (wall.isFancyWall) {
		draw_sprite_ext(wallToDraw.s, wallToDraw.f, tileDrawX, tileDrawY + tileZ, 1, 1, 0, c_white, a);
		wallToDraw = wall.drawOrder[DRAW_ORDER.FORE_G];
		draw_sprite_ext(wallToDraw.s, wallToDraw.f, tileDrawX, tileDrawY + tileZ, 1, 1, 0, c_white, a);
	} else {
		draw_sprite_ext(wallToDraw.s, wallToDraw.f, tileDrawX, tileDrawY + tileZ, 1, 1, 0, c_white, a);	
	}
}

function DrawInstance(inst) {
	// if the instance is not already drawn, draw it and mark it as drawn
	if (!inst.drawn) {
		switch (inst.image_angle) {
			case 0:
				draw_sprite(inst.sprite, 0, inst.drawX, inst.drawY);
				break;
			case 90:
				draw_sprite(inst.sprite, 1, inst.drawX, inst.drawY);
				break;
			case 180:
				draw_sprite(inst.sprite, 2, inst.drawX, inst.drawY);
				break;
			case 270:
				draw_sprite(inst.sprite, 3, inst.drawX, inst.drawY);
				break;
		}
		inst.drawn = true;
	}
}

// Draws the instance layer of the map. This is the most complex layer with the dank logic
function DrawInstanceLayer() {
	// mark all instances as not drawn
	poObjects.drawn = false;
	// draw all wall tiles and instances
	for (var i = 0; i < MAP_W; i++) {
		DrawRowToPoint(i, MAP_H);	
	}
}

// Draws the background walls in the specified area of the tilemap, ignoring the top left most wall. marks the cells as drawn
function DrawBGWalls(xTop, yTop, xBot, yBot) {
	for (var i = xTop; i <= xBot; i++) {
		for (var j = yTop; j <= yBot; j++) {
			if (i == xTop && j == yTop) {
				continue;	
			} else {
				// draw the walls
				var tileData = global.theTopMap[# i, j];
				var tileDrawX = TileToScreenX(i, j);
				var tileDrawY = TileToScreenY(i, j);
				var tileIndex = tileData[TILE.SPRITE];
				var tileZ = tileData[TILE.Z];
				
				var isWallHere = (tileIndex != 0);
				if (isWallHere) {
					// get the collider grid index at the top left of the tile
					var wallColliderXTL = i * 4;
					var wallColliderYTL = j * 4;
					// get the collider grid index at the bottom right
					var wallColliderXBR = wallColliderXTL + 3;
					var wallColliderYBR = wallColliderYTL + 3;
					// is this collision cell marked? if so, it's a foreground wall
					var isForegroundWall = (mp_grid_get_cell(grid, wallColliderXBR, wallColliderYBR) == -1);
					
					// draw the wall if it's not foreground
					if (!isForegroundWall) {
						DrawWall(i, j, tileIndex, tileDrawX, tileDrawY, tileZ);
						// mark cell as visited
						oRenderer.visited[# i, j] = true;
					}
				}
			}
		}
	}
}

// big boi recursive logic
function DrawRowToPoint(rowNumber, stoppingPoint) {
	// Loop the row and draw each cell
	for (var i = 0; i < stoppingPoint; i++) {
		// if this tile has been visited, continue
		if (oRenderer.visited[# rowNumber, i] == true) {
			continue;	
		}
		
		var tileData = global.theTopMap[# rowNumber, i];
		var tileDrawX = TileToScreenX(rowNumber, i);
		var tileDrawY = TileToScreenY(rowNumber, i);
		var tileIndex = tileData[TILE.SPRITE];
		var tileZ = tileData[TILE.Z];
		
		// draw the pointer if necessary
		if (oPlayer.isMoving) {
			if (rowNumber == oRenderer.pointerDrawXTile && i == oRenderer.pointerDrawYTile) {
				DrawPointer();
			}
		}
		
		// set up flags
		var isWallHere = (tileIndex != 0);
		var isInstanceHere = false;
		// test for an instance
		var inst;
		inst = instance_position(rowNumber * 16 + 8, i * 16 + 8, poObjects);
		// set instance flag
		isInstanceHere = (inst != noone && inst.sprite != noone);
		
		// if an instance is here, how many rows does it occupy? also, don't do this if the instance is already drawn
		if (isInstanceHere) {
			// has the instance been drawn already?
			var instanceIsDrawn = inst.drawn;
			var instanceRows = inst.sprite_height / TILE_H;	// TILE_H = 16
			var instanceCols = inst.sprite_width / TILE_H;
			
			// if the instance is bigger than 1x1 tile, draw all background walls occupying same tiles as instance
			if (instanceRows > 1 || instanceCols > 1) {
				DrawBGWalls(rowNumber, i, rowNumber + (instanceRows - 1), i + (instanceCols - 1));	
			}
			
			// if the instance occupies more than 1 row, we need to check the rows behind it
			if (instanceRows > 1 && !instanceIsDrawn) {
				for (var j = rowNumber + 1; j < rowNumber + instanceRows; j++) {
					DrawRowToPoint(j, i);	
				}
			}
		}
		
		// if there is a drawable instance AND a wall, test to see if the wall has a 
		// collider at the bottom right corner (denoting that it is a foreground wall)
		var tileX = rowNumber;
		var tileY = i;
		if (isWallHere && isInstanceHere) {
			// get the collider grid index at the top left of the tile
			var wallColliderXTL = tileX * 4;
			var wallColliderYTL = tileY * 4;
			// get the collider grid index at the bottom right
			var wallColliderXBR = wallColliderXTL + 3;
			var wallColliderYBR = wallColliderYTL + 3;
			// is this collision cell marked? if so, it's a foreground wall
			var isForegroundWall = (mp_grid_get_cell(grid, wallColliderXBR, wallColliderYBR) == -1);
			
			if (isForegroundWall) {
				// Draw instance first
				DrawInstance(inst);
				// Draw wall second
				DrawWall(tileX, tileY, tileIndex, tileDrawX, tileDrawY, tileZ);
			} else {
				// Draw wall first
				DrawWall(tileX, tileY, tileIndex, tileDrawX, tileDrawY, tileZ);
				// Draw instance second
				DrawInstance(inst);
			}		
		} else {
			// Just draw the stuff with the previous logic
			if (isWallHere) {
				// draw the wall
				DrawWall(tileX, tileY, tileIndex, tileDrawX, tileDrawY, tileZ);	
			}
			if (isInstanceHere) {
				// draw the instance
				DrawInstance(inst);
			}
		}
		// render the player if player is on the current tile
		if (rowNumber == oRenderer.playerDrawXTile && i == oRenderer.playerDrawYTile) {
			DrawPlayer();
		}
		// mark the cell as visited
		oRenderer.visited[# rowNumber, i] = true;
	}
}
