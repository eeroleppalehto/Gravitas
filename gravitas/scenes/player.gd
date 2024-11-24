extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const NULL_VECTOR = Vector2(0, 0)


func _ready() -> void:
	Gravity.player = self

func _physics_process(delta: float) -> void:
	# TODO: check if on floor and put speed to 0 instead of the current implementation
	# Add the gravity.
	if not is_on_floor():
		velocity += Gravity.currentGravity * delta
	
	if is_on_floor_only():
		# velocity.x = 0
		pass

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity -= Gravity.currentGravity * 0.5
	
	move_and_slide()
	
	if Gravity.isRotating:
		Gravity.rotate()

	if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
		Gravity.rotate()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
