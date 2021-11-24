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