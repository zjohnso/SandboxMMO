if (playerInteracting) {
	if (framesSinceLastHit > 30) {
		framesSinceLastHit = 0;
		oPlayer.inventory.AddItem(itemYield, yield);
	}
	framesSinceLastHit++;
}