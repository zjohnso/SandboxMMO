enum ARMOR_SLOT {
	HEAD,
	CHEST,
	HANDS,
	LEGS,
	FEET
}

function Item() constructor {
	name = "";
	value = 0;
	_id = -1;
	stackable = false;
	equipment = false;
	sprite = sCollider;
}

function Resource() : Item() constructor {
	stackable = true;
	maxStack = 20;
}

function Armor() : Item() constructor {
	stackable = false;
	equipment = true;
	slot = noone;
}