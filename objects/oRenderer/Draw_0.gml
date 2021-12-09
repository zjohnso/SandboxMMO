var tileData, roomX, roomY, tileIndex, tileZ;
var playerDrawXTile = ScreenXToTile(oPlayer.drawX, oPlayer.drawY);
var playerDrawYTile = ScreenYToTile(oPlayer.drawX, oPlayer.drawY);
var pointerDrawXTile = ScreenXToTile(oPlayer.destinationX, oPlayer.destinationY);
var pointerDrawYTile = ScreenYToTile(oPlayer.destinationX, oPlayer.destinationY);

// Draw the ground and floor layer before everything else
DrawGroundAndFloorLayer();

for (var k = 0; k <= MAP_W + MAP_H - 2; k++) {
	for (var j = 0; j <= k; j++) {
		var i = k - j;
		if (i < MAP_W && j < MAP_H) {
			tileData = global.theTopMap[# i, j];
			roomX = TileToScreenX(i, j);
			roomY = TileToScreenY(i, j);
		
			tileIndex = tileData[TILE.SPRITE];
			tileZ = tileData[TILE.Z];
		
			if (oPlayer.isMoving) {
				if (i == pointerDrawXTile && j == pointerDrawYTile) {
					draw_sprite(sDestination, 0, oPlayer.destinationX, oPlayer.destinationY);	
				}
			}
		
			// set up flags
			var isWallHere = (tileIndex != 0);
			var isInstanceHere = false;
			// test for an instance
			var inst;
			inst = instance_position(i * 16 + 8, j * 16 + 8, poObjects);
			// set instance flag
			isInstanceHere = (inst != noone && inst.sprite != noone);
		
			// if there is a drawable instance AND a wall, test to see if the wall has a 
			// collider at the bottom right corner (denoting that it is a foreground wall)
			if (isWallHere && isInstanceHere) {
				var tileX = i;
				var tileY = j;
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
					// Draw wall second
					var a = 1;
					if (i >= playerDrawXTile && i < playerDrawXTile + 2) {
						if (j >= playerDrawYTile && j < playerDrawYTile + 2) {
							a = .25;	
						}
					}
					draw_sprite_ext(sIsoWall, tileIndex - 1, roomX, roomY + tileZ, 1, 1, 0, c_white, a);
				} else {
					// Draw wall first
					var a = 1;
					if (i >= playerDrawXTile && i < playerDrawXTile + 2) {
						if (j >= playerDrawYTile && j < playerDrawYTile + 2) {
							a = .25;	
						}
					}
					draw_sprite_ext(sIsoWall, tileIndex - 1, roomX, roomY + tileZ, 1, 1, 0, c_white, a);
					// Draw instance second
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
				}		
			} else {
				// Just draw the stuff with the previous logic
				if (isWallHere) {
					var a = 1;
					if (i >= playerDrawXTile && i < playerDrawXTile + 2) {
						if (j >= playerDrawYTile && j < playerDrawYTile + 2) {
							a = .25;	
						}
					}
					draw_sprite_ext(sIsoWall, tileIndex - 1, roomX, roomY + tileZ, 1, 1, 0, c_white, a);	
				}
			
				if (isInstanceHere) {
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
				}
			}
			// render the player
			if (i == playerDrawXTile && j == playerDrawYTile) {
				draw_sprite(sPlayer, 0, oPlayer.drawX, oPlayer.drawY);
				// render the player's santa hat if has one TEMP REMOVE LATER
				if (oPlayer.hasSantaHat) {
					draw_sprite(sSantaHat, 0, oPlayer.drawX, oPlayer.drawY - oPlayer.height);	
				}
			}	
			
		}
		
	}
}

// Draw the roof layer on top of everything else
DrawRoofLayer();


