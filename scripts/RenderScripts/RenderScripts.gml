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
	
