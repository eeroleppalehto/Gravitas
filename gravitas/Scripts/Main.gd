extends Node2D


func _ready():
	Audio.play_music_level()
	pass

func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	# Set Gravity mode to "scene" and reset all states
	Gravity.mode = "scene"
	Gravity.isRotating = false
	Gravity.currentGravityDirection = Gravity.SOUTH
	Gravity.currentGravity = Gravity.GRAVITY_SOUTH
	Gravity.isTurningRight = false
	Gravity.isTurningLeft = false
	Gravity.rotation_state = 0.0
	get_tree().change_scene_to_file("res://scenes/world_scene_2/world2.tscn")


func _on_play_b_pressed() -> void:
	# Set Gravity mode to "player" and reset all states
	Gravity.mode = "player"
	Gravity.isRotating = false
	Gravity.currentGravityDirection = Gravity.SOUTH
	Gravity.currentGravity = Gravity.GRAVITY_SOUTH
	Gravity.isTurningRight = false
	Gravity.isTurningLeft = false
	Gravity.rotation_state = 0.0
	get_tree().change_scene_to_file("res://scenes/world_scene_2/world2.tscn")


func _on_play_a_pressed() -> void:
	# Set Gravity mode to "scene" and reset all states
	Gravity.mode = "scene"
	Gravity.isRotating = false
	Gravity.currentGravityDirection = Gravity.SOUTH
	Gravity.currentGravity = Gravity.GRAVITY_SOUTH
	Gravity.isTurningRight = false
	Gravity.isTurningLeft = false
	Gravity.rotation_state = 0.0
	get_tree().change_scene_to_file("res://scenes/world_scene_2/world2.tscn")
