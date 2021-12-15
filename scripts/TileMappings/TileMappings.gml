function IsoTileConstruct(hasMultiple, isoTilesToDraw) constructor {
	isFancyWall = hasMultiple;
	drawOrder = isoTilesToDraw;
}

// constructor to locate what to draw for a wall tile
function IsoTile(sprite, frame) constructor {
	s = sprite;
	f = frame;
}

// map tile map to iso sprites IN ORDER
// 0 index of tilemap will be transparent, so starting with 1
global.wallMapping = [
	new IsoTileConstruct(false, [new IsoTile(sIsoWall, 0)]), // tells the mapping system to draw the first frame of sIsoWall when it finds tile 1 of the tilemap
	new IsoTileConstruct(false, [new IsoTile(sIsoWall, 1)]),
	new IsoTileConstruct(false, [new IsoTile(sIsoWall, 2)]),
	new IsoTileConstruct(false, [new IsoTile(sIsoWall, 3)]),
	new IsoTileConstruct(true, [new IsoTile(sIsoWall, 2), new IsoTile(sIsoWall, 1)]), // this is a corner tile, so we tell the system which wall to draw first of the corner (BG) and second (FG)
	new IsoTileConstruct(true, [new IsoTile(sIsoWall, 3), new IsoTile(sIsoWall, 0)]),
	new IsoTileConstruct(false, [new IsoTile(sIsoWall, 4)]),
	new IsoTileConstruct(false, [new IsoTile(sIsoWall, 5)]),
];