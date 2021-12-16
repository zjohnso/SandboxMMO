function IsoTileConstruct(tileBG, tileFG) constructor {
	background = tileBG;
	foreground = tileFG;
}

// constructor to locate what to draw for a wall tile
function IsoTile(sprite, frame) constructor {
	s = sprite;
	f = frame;
}

// map tile map to iso sprites IN ORDER
// 0 index of tilemap will be transparent, so starting with 1
// all walls need to have an item in each of two slots: 1st slot is BG and 2nd slot is FG
global.wallMapping = [
	new IsoTileConstruct(noone, new IsoTile(sIsoWall, 0)), // tells the mapping system to draw the first frame of sIsoWall when it finds tile 1 of the tilemap
	new IsoTileConstruct(noone, new IsoTile(sIsoWall, 1)),
	new IsoTileConstruct(new IsoTile(sIsoWall, 2), noone),
	new IsoTileConstruct(new IsoTile(sIsoWall, 3), noone),
	new IsoTileConstruct(new IsoTile(sIsoWall, 2), new IsoTile(sIsoWall, 1)), // this is a corner tile, so we tell the system which wall to draw first of the corner (BG) and second (FG)
	new IsoTileConstruct(new IsoTile(sIsoWall, 3), new IsoTile(sIsoWall, 0)),
	new IsoTileConstruct(noone, new IsoTile(sIsoWall, 4)),
	new IsoTileConstruct(new IsoTile(sIsoWall, 5), noone),
];