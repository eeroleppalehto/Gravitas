extends Area2D

signal _item_collected  # Signal for item collection

# Reference to the Collectables instance
# var collectables: Collectables

func _ready() -> void:
	# Assuming you have a global or singleton instance of Collectables
	# collectables = get_node("res://collectables.gd")  # Adjust the path as needed
	connect("_item_collected", Collectables.collect_item1)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Collectables2.blobs += 1
		emit_signal("_item_collected", 1)  # Emit signal with amount (1 for this example)
		queue_free()  # Remove the item from the scene

# Handle the item collection signal
#func _on_item_collected(amount: int) -> void:
#	print("Item 1 collected: ", amount)
#	Collectables.collect_item1(amount)  # Update the collectables instance
