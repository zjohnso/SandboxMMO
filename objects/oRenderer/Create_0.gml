layer_set_visible("GroundTiles", false);
layer_set_visible("WallTiles", false);
layer_set_visible("RoofTiles", false);
layer_set_visible("ColliderTiles", false);
draw_set_font(GameFont);
global.theMap = ds_grid_create(MAP_W, MAP_H);
global.theTopMap = ds_grid_create(MAP_W, MAP_H);
global.theRoofMap = ds_grid_create(MAP_W, MAP_H);
global.drawRoof = true;

// toggle snow on or off
snow = true;

globalvar grid;
grid = mp_grid_create(0,0,room_width div 4, room_height div 4, 4, 4);

var tileMap = layer_tilemap_get_id("GroundTiles");
for (var i = 0; i < MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		var tileMapData = tilemap_get(tileMap, i, j);
		// [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = 0;
		global.theMap[# i, j] = thisTile;
	}
}
tileMap = layer_tilemap_get_id("WallTiles");
for (var i = 0; i < MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		var tileMapData = tilemap_get(tileMap, i, j);
		// [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = 0;
		global.theTopMap[# i, j] = thisTile;
	}
}
tileMap = layer_tilemap_get_id("RoofTiles");
for (var i = 0; i < MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		var tileMapData = tilemap_get(tileMap, i, j);
		// [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = 0;
		global.theRoofMap[# i, j] = thisTile;
	}
}
tileMap = layer_tilemap_get_id("ColliderTiles");
for (var i = 0; i < MAP_W * 4; i++) {
	for (var j = 0; j < MAP_H * 4; j++) {
		var tileMapData = tilemap_get(tileMap, i, j);
		if (tileMapData == 1) {
			mp_grid_add_cell(grid, i, j);	
		}
	}
}
tileMap = layer_tilemap_get_id("RoofTiles");
for (var i = 0; i < MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		var tileMapData = tilemap_get(tileMap, i, j);
		// [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = 0;
		global.theRoofMap[# i, j] = thisTile;
	}
}

		