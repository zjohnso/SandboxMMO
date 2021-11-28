/// @description Insert description here
// You can write your code in this editor
if (playerInteracting) {
	if (framesSinceLastHit > 30) {
		framesSinceLastHit = 0;
		if (oPlayer.inventory.RemoveItem(ITEM_ID.FISH, 1)) {
			oPlayer.inventory.AddItem(new CookedFish(), 1);	
		}
	}
	framesSinceLastHit++;
}