if (playerInteracting) {
	if (quantity > 0) {
		oPlayer.inventory.AddItem(item, quantity);
		quantity--;
	}
}