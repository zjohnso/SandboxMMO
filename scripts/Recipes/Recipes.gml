function RecipeSlot(_item, _quantity) constructor {
	item = _item;
	quantity = _quantity;
}

function Recipe_CookedFish() constructor {
	input = [new RecipeSlot(new Fish(), 1)];
	output = [new RecipeSlot(new CookedFish(), 1)];
}

function Recipe_Plank() constructor {
	input = [new RecipeSlot(new Log(), 1)];
	output = [new RecipeSlot(new Plank(), 1)];
}