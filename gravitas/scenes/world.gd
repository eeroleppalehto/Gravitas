extends Node2D

const ANGLE = 90.0
const ROTATION_DELTA = 3
var isTurningRight = false
var isTurningLeft = false
var rotation_state = 0.0


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):

		get_tree().change_scene_to_file("res://scenes/Main.tscn")

	if isTurningRight:
		var currentRotation = get_rotation_degrees()
		var player: CharacterBody2D = get_node("player/Player")
		if ANGLE > rotation_state:
			set_rotation_degrees(currentRotation + ROTATION_DELTA)
			player.set_rotation_degrees(player.rotation_degrees - ROTATION_DELTA)
			rotation_state += ROTATION_DELTA
		else:
			isTurningRight = false
			rotation_state = 0
		return
		
	if isTurningLeft:
		var currentRotation = get_rotation_degrees()
		var player: CharacterBody2D = get_node("player/Player")
		if ANGLE > rotation_state:
			set_rotation_degrees(currentRotation - ROTATION_DELTA)
			player.set_rotation_degrees(player.rotation_degrees + ROTATION_DELTA)
			rotation_state += ROTATION_DELTA
		else:
			isTurningLeft = false
			rotation_state = 0
		return

	if Input.is_action_just_pressed("ui_down"):
		print(get_rotation_degrees())
		isTurningRight = true

	if Input.is_action_just_pressed("ui_up"):
		print(get_rotation_degrees())
		isTurningLeft = true
