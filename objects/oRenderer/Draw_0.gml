playerDrawXTile = ScreenXToTile(oPlayer.drawX, oPlayer.drawY);
playerDrawYTile = ScreenYToTile(oPlayer.drawX, oPlayer.drawY);
pointerDrawXTile = ScreenXToTile(oPlayer.destinationX, oPlayer.destinationY);
pointerDrawYTile = ScreenYToTile(oPlayer.destinationX, oPlayer.destinationY);
ds_grid_set_region(visited, 0, 0, MAP_W, MAP_H, false);

// Draw the ground and floor layer before everything else
DrawGroundAndFloorLayer();

// Draw the instance layer and order everything using magic
DrawInstanceLayer();

// Draw the roof layer on top of everything else
DrawRoofLayer();


