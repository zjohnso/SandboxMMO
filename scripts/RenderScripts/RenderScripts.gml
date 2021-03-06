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

function DrawWallBG(tileY, tileX, tileIndex, tileDrawX, tileDrawY, tileZ) {
	var a = 1;
	if (tileX >= oRenderer.playerDrawXTile && tileX < oRenderer.playerDrawXTile + 2) {
		if (tileY >= oRenderer.playerDrawYTile && tileY < oRenderer.playerDrawYTile + 2) {
			a = .25;	
		}
	}
	var wall = global.wallMapping[tileIndex - 1];
	draw_sprite_ext(wall.background.s, wall.background.f, tileDrawX, tileDrawY + tileZ, 1, 1, 0, c_white, a);
}

function DrawWallFG(tileY, tileX, tileIndex, tileDrawX, tileDrawY, tileZ) {
	var a = 1;
	if (tileX >= oRenderer.playerDrawXTile && tileX < oRenderer.playerDrawXTile + 2) {
		if (tileY >= oRenderer.playerDrawYTile && tileY < oRenderer.playerDrawYTile + 2) {
			a = .25;	
		}
	}
	var wall = global.wallMapping[tileIndex - 1];
	draw_sprite_ext(wall.foreground.s, wall.foreground.f, tileDrawX, tileDrawY + tileZ, 1, 1, 0, c_white, a);
}

function DrawWall(tileY, tileX, tileIndex, tileDrawX, tileDrawY, tileZ) {
	var a = 1;
	if (tileX >= oRenderer.playerDrawXTile && tileX < oRenderer.playerDrawXTile + 2) {
		if (tileY >= oRenderer.playerDrawYTile && tileY < oRenderer.playerDrawYTile + 2) {
			a = .25;	
		}
	}
	var wall = global.wallMapping[tileIndex - 1];
	if (wall.background != noone && !oRenderer.partial[# tileX, tileY]) {
		draw_sprite_ext(wall.background.s, wall.background.f, tileDrawX, tileDrawY + tileZ, 1, 1, 0, c_white, a);
	}
	if (wall.foreground != noone) {
		draw_sprite_ext(wall.foreground.s, wall.foreground.f, tileDrawX, tileDrawY + tileZ, 1, 1, 0, c_white, a);
	}
}

function DrawWallAndPlayer(tileY, tileX, tileIndex, tileDrawX, tileDrawY, tileZ) {
	var a = 1;
	if (tileX >= oRenderer.playerDrawXTile && tileX < oRenderer.playerDrawXTile + 2) {
		if (tileY >= oRenderer.playerDrawYTile && tileY < oRenderer.playerDrawYTile + 2) {
			a = .25;	
		}
	}
	var wall = global.wallMapping[tileIndex - 1];
	if (wall.background != noone && !oRenderer.partial[# tileX, tileY]) {
		draw_sprite_ext(wall.background.s, wall.background.f, tileDrawX, tileDrawY + tileZ, 1, 1, 0, c_white, a);
	}
	DrawPlayer();
	if (wall.foreground != noone) {
		draw_sprite_ext(wall.foreground.s, wall.foreground.f, tileDrawX, tileDrawY + tileZ, 1, 1, 0, c_white, a);
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
	for (var i = 0; i < MAP_H; i++) {
		DrawRowToPoint(i, MAP_W);	
	}
}

// Draws the background walls in the specified area of the tilemap, ignoring the top left most wall. marks the cells as drawn
function DrawBGWalls(xTop, yTop, xBot, yBot) {
	for (var i = xTop; i <= xBot; i++) {
		for (var j = yTop; j <= yBot; j++) {
			// get the tile data of the wall
			var tileData = global.theTopMap[# j, i];
			var tileDrawX = TileToScreenX(j, i);
			var tileDrawY = TileToScreenY(j, i);
			var tileIndex = tileData[TILE.SPRITE];
			var tileZ = tileData[TILE.Z];
			// get the wall mapping
			if (tileIndex != 0) {
				var wall = global.wallMapping[tileIndex - 1];
				// if the wall has a background layer, draw it
				if (wall.background != noone) {
					DrawWallBG(j, i, tileIndex, tileDrawX, tileDrawY, tileZ);
					oRenderer.partial[# j, i] = true;
				}
			}
		}
	}
}

// big boi recursive logic
function DrawRowToPoint(rowNumber, stoppingPoint) {
	// Loop the row and draw each cell
	for (var i = 0; i < stoppingPoint; i++) {
		var tileData = global.theTopMap[# i, rowNumber];
		var tileDrawX = TileToScreenX(i, rowNumber);
		var tileDrawY = TileToScreenY(i, rowNumber);
		var tileIndex = tileData[TILE.SPRITE];
		var tileZ = tileData[TILE.Z];
		
		// if the cell is already visited, continue
		if (oRenderer.visited[# i, rowNumber]) {
			continue;
		}
		
		// draw the pointer if necessary
		if (oPlayer.isMoving) {
			if (i == oRenderer.pointerDrawXTile && rowNumber == oRenderer.pointerDrawYTile) {
				DrawPointer();
			}
		}
		
		// set up flags
		var isWallHere = (tileIndex != 0);
		// test for an instance
		var inst = instance_position(i * 16 + 8, rowNumber * 16 + 8, poObjects);
		// set instance flag
		var isInstanceHere = (inst != noone && inst.sprite != noone);
		// set player flag
		var isPlayerHere = (i == oRenderer.playerDrawXTile && rowNumber == oRenderer.playerDrawYTile);
		
		// if an instance is here, how many rows does it occupy? also, don't do this if the instance is already drawn
		if (isInstanceHere) {
			// has the instance been drawn already?
			var instanceIsDrawn = inst.drawn;
			var instanceRows = inst.sprite_height / TILE_H;	// TILE_H = 16
			var instanceCols = inst.sprite_width / TILE_H;
			
			// if the instance occupies more than 1 row, we need to check the rows behind it
			if (instanceRows > 1 && !instanceIsDrawn) {
				//show_debug_message(instanceRows);
				//show_debug_message(rowNumber);
				//show_debug_message(i);
				for (var j = rowNumber + 1; j < rowNumber + instanceRows; j++) {
					DrawRowToPoint(j, i);	
				}
			}
			
			// draw all background walls around instance
			if (!instanceIsDrawn) {
				DrawBGWalls(rowNumber, i, rowNumber + (instanceRows - 1), i + (instanceCols - 1));
			}
		}
		
		// if there is a drawable instance AND a wall, test to see if the wall has a 
		// collider at the bottom right corner (denoting that it is a foreground wall)
		var tileX = rowNumber;
		var tileY = i;
		if (isWallHere && isInstanceHere) {
			// draw player behind object
			if (isPlayerHere && instanceRows > 1 && instanceCols > 1) {
				DrawPlayer();
			}
			// draw the instance since all bg walls taken care of
			DrawInstance(inst);
			
			if (isPlayerHere && instanceRows == 1 && instanceCols == 1) {
				DrawPlayer();	
			}
			// draw the foreground wall at this location if it exists
			var wall = global.wallMapping[tileIndex - 1];
			if (wall.foreground != noone) {
				DrawWallFG(tileX, tileY, tileIndex, tileDrawX, tileDrawY, tileZ);	
			}
		} else {
			// Just draw the stuff with the previous logic
			if (isWallHere) {
				if (isPlayerHere) {
					DrawWallAndPlayer(tileX, tileY, tileIndex, tileDrawX, tileDrawY, tileZ);	
				} else {
					// draw the wall
					DrawWall(tileX, tileY, tileIndex, tileDrawX, tileDrawY, tileZ);	
				}
			}
			if (isInstanceHere) {
				// draw the instance
				if (isPlayerHere && instanceRows > 1 && instanceCols > 1) {
					DrawPlayer();
				}
				DrawInstance(inst);
				if (isPlayerHere && instanceRows == 1 && instanceCols == 1) {
					DrawPlayer();	
				}
			}
			if (!isWallHere && !isInstanceHere) {
				if (isPlayerHere) {
					DrawPlayer();	
				}
			}
		}
		// mark the cell as visited
		oRenderer.visited[# i, rowNumber] = true;
	}
}
