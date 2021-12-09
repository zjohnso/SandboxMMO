// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TileToScreenX(_tX, _tY){
	return ((_tX - _tY) * (TILE_W * .5));
}

function TileToScreenY(_tX, _tY){
	return ((_tX + _tY) * (TILE_H * .5));
}

function ToIsoX(_x, _y) {
	_x = round(_x);
	_y = round(_y);
	return ((_x - _y));
}

function ToIsoY(_x, _y, _z) {
	_x = round(_x);
	_y = round(_y);
	return ((_x + _y)/2) + _z;
}

function MobToIsoX(_x, _y) {
	return ((_x - _y));
}

function MobToIsoY(_x, _y, _z) {
	return ((_x + _y)/2) + _z;
}

function ToCartX(_isoX, _isoY) {
	return (.5*_isoX + _isoY);
}

function ToCartY(_isoX, _isoY) {
	return (_isoY - 0.5*_isoX);	
}

function ScreenXToTile(_x, _y) {
	return floor(_x/TILE_W + _y/TILE_H);
}

function ScreenYToTile(_x, _y) {
	return floor(_y/TILE_H - _x/TILE_W);	
}

function CartToTileX(_x) {
	return floor(_x / 16);	
}

function CartToTileY(_y) {
	return floor(_y / 16);	
}