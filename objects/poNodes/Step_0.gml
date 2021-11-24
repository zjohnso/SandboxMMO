if (playerHarvesting) {
	if (framesSinceLastHit > 30) {
		framesSinceLastHit = 0;
		oPlayer.logs += yield;
		oPlayer.inventory.AddItem(itemYield, yield);
	}
	framesSinceLastHit++;
}