extends Area2D

signal item_collected  # Signal for item collection

# Reference to the Collectables instance
var collectables: Collectables

func _ready() -> void:
	# Assuming you have a global or singleton instance of Collectables
	collectables = get_node("res://collectables.gd")  # Adjust the path as needed
	connect("item_collected", collectables, "_on_item_collected")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("item_collected", 1)  # Emit signal with amount (1 for this example)
		queue_free()  # Remove the item from the scene

# Handle the item collection signal
func _on_item_collected(amount: int) -> void:
	print("Item 1 collected: ", amount)
	collectables.collect_item1(amount)  # Update the collectables instance
