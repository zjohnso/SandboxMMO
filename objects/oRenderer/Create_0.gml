layer_set_visible("GroundTiles", false);
layer_set_visible("WallTiles", false);
layer_set_visible("FloorTiles", false);
layer_set_visible("RoofTiles", false);
layer_set_visible("ColliderTiles", false);
draw_set_font(GameFont);
global.theMap = ds_grid_create(MAP_W, MAP_H);
global.theFloorMap = ds_grid_create(MAP_W, MAP_H);
global.theTopMap = ds_grid_create(MAP_W, MAP_H);
global.theRoofMap = ds_grid_create(MAP_W, MAP_H);
global.drawRoof = true;

// create boolean map to keep track of visited cells for instance layer and set init to false
visited = ds_grid_create(MAP_W, MAP_H);
ds_grid_set_region(visited, 0, 0, MAP_W, MAP_H, false);

// toggle snow on or off
snow = true;

globalvar grid;
grid = mp_grid_create(0,0,room_width div 4, room_height div 4, 4, 4);

var groundMap = layer_tilemap_get_id("GroundTiles");
var floorMap = layer_tilemap_get_id("FloorTiles");
var wallMap = layer_tilemap_get_id("WallTiles");
var roofMap = layer_tilemap_get_id("RoofTiles");
var colliderMap = layer_tilemap_get_id("ColliderTiles");
for (var i = 0; i < MAP_W; i++) {
	for (var j = 0; j < MAP_H; j++) {
		// set ground map data
		var tileMapData = tilemap_get(groundMap, i, j);
		// [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = 0;
		global.theMap[# i, j] = thisTile;
		
		// set floor map data
		tileMapData = tilemap_get(floorMap, i, j);
		// [Sprite, Z]
		thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = 0;
		global.theFloorMap[# i, j] = thisTile;
		
		// set wall map data
		tileMapData = tilemap_get(wallMap, i, j);
		// [Sprite, Z]
		thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = 0;
		global.theTopMap[# i, j] = thisTile;
		
		// set roof map data
		tileMapData = tilemap_get(roofMap, i, j);
		// [Sprite, Z]
		thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = 0;
		global.theRoofMap[# i, j] = thisTile;
	}
}

// set collision map data
for (var i = 0; i < MAP_W * 4; i++) {
	for (var j = 0; j < MAP_H * 4; j++) {
		var tileMapData = tilemap_get(colliderMap, i, j);
		if (tileMapData == 1) {
			mp_grid_add_cell(grid, i, j);	
		}
	}
}
		