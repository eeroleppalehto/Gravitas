extends Node2D




func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	Gravity.mode = "scene"
	get_tree().change_scene_to_file("res://scenes/world_scene_2/world2.tscn")


func _on_play_b_pressed() -> void:
	Gravity.mode = "player"
	Gravity.isRotating = false
	Gravity.currentGravityDirection = Gravity.SOUTH
	Gravity.currentGravity = Gravity.GRAVITY_SOUTH
	get_tree().change_scene_to_file("res://scenes/world_scene_2/world2.tscn")
