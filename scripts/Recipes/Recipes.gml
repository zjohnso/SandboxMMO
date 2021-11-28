function RecipeSlot(item, quantity) constructor {
	_item = item;
	_quantity = quantity;
}

function Recipe_CookedFish() constructor {
	input = [new RecipeSlot(new Fish(), 1)];
	output = [new RecipeSlot(new CookedFish(), 1)];
}