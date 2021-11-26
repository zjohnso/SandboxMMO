var tileData, roomX, roomY, tileIndex, tileZ;
var playerDrawXTile = ScreenXToTile(oPlayer.drawX, oPlayer.drawY);
var playerDrawYTile = ScreenYToTile(oPlayer.drawX, oPlayer.drawY);		
var pointerDrawXTile = ScreenXToTile(oPlayer.destinationX, oPlayer.destinationY);
var pointerDrawYTile = ScreenYToTile(oPlayer.destinationX, oPlayer.destinationY);
for (var i = 0; i< MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		tileData = global.theMap[# i, j];
		
		roomX = TileToScreenX(i, j);
		roomY = TileToScreenY(i, j);
		
		tileIndex = tileData[TILE.SPRITE];
		tileZ = tileData[TILE.Z];
		
		if (tileIndex != 0) {
			draw_sprite(sIsoGrass, tileIndex - 1, roomX, roomY - tileZ);	
		}
	}
}

for (var i = 0; i< MAP_W; i++) {
	for (var j = 0; j <MAP_H; j++) {
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
		
		if (tileIndex != 0) {
			var a = 1;
			if (i >= playerDrawXTile && i < playerDrawXTile + 3) {
				if (j >= playerDrawYTile && j < playerDrawYTile + 3) {
					a = .25;	
				}
			}
			draw_sprite_ext(sIsoWall, tileIndex - 1, roomX, roomY + tileZ, 1, 1, 0, c_white, a);	
		}
		
		var inst;
		inst = instance_position(i * 16 + 8, j * 16 + 8, poObjects);
		if (inst != noone) {
			if (inst.sprite != noone) {
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
		
		if (i == playerDrawXTile && j == playerDrawYTile) {
			draw_sprite(sPlayer, 0, oPlayer.drawX, oPlayer.drawY);
		}
		
	}
}

if (global.drawRoof) {
	for (var i = 0; i< MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		tileData = global.theRoofMap[# i, j];
		
		roomX = TileToScreenX(i, j);
		roomY = TileToScreenY(i, j);
		
		tileIndex = tileData[TILE.SPRITE];
		tileZ = tileData[TILE.Z];
		
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
