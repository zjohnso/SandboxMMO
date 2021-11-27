/// @description Insert description here
// You can write your code in this editor
if (playerInteracting && oPlayer.inventory.Contains(Fish._id)) {
	index = oPlayer.GetIndex(Fish._id);
	oPlayer.inventory.RemoveItem(index, Fish._id);
	oPlayer.inventory.addItem(new CookedFish(), 1);
}