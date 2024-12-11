extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Player" and Collectables2.blobs>2:
		Collectables2.blobs += -3
		queue_free()
