function Log() : Resource() constructor {
	name = "Log";
	value = 2;
	sprite = sLog;
	_id = ITEM_ID.LOG;
}

function Coal() : Resource() constructor {
	name = "Coal"
	value = 5;
	sprite = sCoal;
	_id = ITEM_ID.COAL;
}

function Fish() : Resource() constructor {
	name = "Fish";
	value = 3;
	sprite = sFish;
	_id = ITEM_ID.FISH;
}

function CookedFish() : Resource() constructor {
	name = "CookedFish";
	value = 5;
	sprite = sCookedFish;
	_id = ITEM_ID.COOKED_FISH;
}

function Plank() : Resource() constructor {
	name = "Plank";
	value = 5;
	sprite = sPlank;
	_id = ITEM_ID.PLANK;
}

function SantaHat() : Armor() constructor {
	name = "Santa Hat";
	value = 500;
	sprite = sSantaHat;
	_id = ITEM_ID.SANTA_HAT;
	slot = ARMOR_SLOT.HEAD;
}