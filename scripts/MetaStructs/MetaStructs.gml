// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Inventory() constructor {
	slots = 50;
	items_list = array_create(slots, noone);
	for (var i = 0; i < slots; i++) {
		items_list[i] = new InventorySlot();	
	}
	
	function Contains(item_id) {
		for (var i = 0; i< array_length(items_list); i++) {
			var slot = items_list[i];
			if (slot.item != noone && slot.item._id == item_id) {
				return true;
			}
		}
	}
	
	function GetIndex(item_id) {
		for (var i = 0; i< array_length(items_list); i++) {
			var slot = items_list[i];
			if (slot.item != noone && slot.item._id == item_id) {
				return i;
			}
		}
	}
	
	function RemoveItem(index, quantity) {
		items_list[index].quantity -= quantity;
	}
	
	function AddItem(item, quantity) {
		for (var i = 0; i< array_length(items_list); i++) {
			var slot = items_list[i];
			if (slot.item != noone && slot.item._id == item._id) {
				if (slot.quantity < slot.item.maxStack) {
					availableSpace = slot.item.maxStack - slot.quantity;
					if (availableSpace < quantity) {
						slot.quantity += availableSpace;
						quantity -= availableSpace;
						break;
					} else {
						slot.quantity += quantity;
						return;
					}
				}
			}
		}
		
		for (var i = 0; i < array_length(items_list); i++) {
			var slot = items_list[i];
			if (slot.item == noone) {
				slot.item = item;
				slot.quantity = quantity;
				return;
			}
		}
		
	}
}

function InventorySlot() constructor {
	item = noone;
	quantity = 0;
}