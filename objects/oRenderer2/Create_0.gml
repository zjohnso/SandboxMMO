layer_set_visible("GroundTiles", false);
layer_set_visible("WallTiles1", false);
layer_set_visible("RoofTiles1", false);
layer_set_visible("WallTiles2", false);
layer_set_visible("RoofTiles2", false);
draw_set_font(GameFont);
global.theMap = ds_grid_create(MAP_W, MAP_H);
global.theTopMap1 = ds_grid_create(MAP_W, MAP_H);
global.theRoofMap1 = ds_grid_create(MAP_W, MAP_H);
global.theTopMap2 = ds_grid_create(MAP_W, MAP_H);
global.theRoofMap2 = ds_grid_create(MAP_W, MAP_H);
global.drawRoof = true;
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
tileMap = layer_tilemap_get_id("WallTiles1");
for (var i = 0; i < MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		var tileMapData = tilemap_get(tileMap, i, j);
		// [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = 0;
		global.theTopMap1[# i, j] = thisTile;
	}
}
tileMap = layer_tilemap_get_id("RoofTiles1");
for (var i = 0; i < MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		var tileMapData = tilemap_get(tileMap, i, j);
		// [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = 0;
		global.theRoofMap1[# i, j] = thisTile;
	}
}

tileMap = layer_tilemap_get_id("WallTiles2");
for (var i = 0; i < MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		var tileMapData = tilemap_get(tileMap, i, j);
		// [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = -16;
		global.theTopMap2[# i, j] = thisTile;
	}
}
tileMap = layer_tilemap_get_id("RoofTiles2");
for (var i = 0; i < MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		var tileMapData = tilemap_get(tileMap, i, j);
		// [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = -16;
		global.theRoofMap2[# i, j] = thisTile;
	}
}

		