extends Node

# Global Gravity variables
var mode = "scene"
var player: CharacterBody2D
var isRotating = false
var currentGravityDirection = SOUTH
var currentGravity: Vector2 = GRAVITY_SOUTH

# Constants and states for rotateScene function
const RIGHT_ANGLE = 90
const ROTATION_DELTA = 3
var isTurningRight = false
var isTurningLeft = false
var rotation_state = 0.0

# Constants and states for rotatePlayer function
const SOUTH = 0
const EAST = 1
const NORTH = 2
const WEST = 3
const GRAVITY_SOUTH = Vector2(0, 980) # Normal gravity
const GRAVITY_EAST = Vector2(980, 0) # Player falls to east
const GRAVITY_NORTH = Vector2(0, -980) # Player falls to north
const GRAVITY_WEST = Vector2(-980, 0) # Player falls to west

func rotate() -> void:
	if mode == "scene":
		rotateScene()
	elif mode == "player":
		rotatePlayer()

func rotateScene() -> void:
	# TODO: make it possible to change direction in the middle of rotation
	# TODO: put velocity.x to 0 when on floor

	var currentScene = get_tree().get_current_scene()
	
	if isTurningRight:
		var currentRotation = currentScene.get_rotation_degrees()
		if RIGHT_ANGLE > rotation_state:
			currentScene.set_rotation_degrees(currentRotation + ROTATION_DELTA)
			player.set_rotation_degrees(player.rotation_degrees - ROTATION_DELTA)
			rotation_state += ROTATION_DELTA
		else:
			isTurningRight = false
			rotation_state = 0
		return
		
	if isTurningLeft:
		var currentRotation = currentScene.get_rotation_degrees()
		if RIGHT_ANGLE > rotation_state:
			currentScene.set_rotation_degrees(currentRotation - ROTATION_DELTA)
			player.set_rotation_degrees(player.rotation_degrees + ROTATION_DELTA)
			rotation_state += ROTATION_DELTA
		else:
			isTurningLeft = false
			rotation_state = 0
		return

	if Input.is_action_just_pressed("ui_down"):
		isRotating = true
		isTurningRight = true

	if Input.is_action_just_pressed("ui_up"):
		isRotating = true
		isTurningLeft = true
	

func rotatePlayer() -> void:
	if Input.is_action_just_pressed("ui_down"):
		currentGravity = Vector2(currentGravity.y, -currentGravity.x)
		currentGravityDirection = (currentGravityDirection + 1) % 4
		
		var currentUpDirection = player.get_up_direction()
		player.set_up_direction(Vector2(currentUpDirection.y, -currentUpDirection.x))
		player.set_rotation_degrees(player.get_rotation_degrees() - 90)

	if Input.is_action_just_pressed("ui_up"):
		currentGravity = Vector2(-currentGravity.y, currentGravity.x)
		currentGravityDirection = (currentGravityDirection - 1) % 4
		
		var currentUpDirection = player.get_up_direction()
		player.set_up_direction(Vector2(-currentUpDirection.y, currentUpDirection.x))
		player.set_rotation_degrees(player.get_rotation_degrees() + 90)
