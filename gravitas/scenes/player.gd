extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const NULL_VECTOR = Vector2(0, 0)
var anim

func _ready() -> void:
	Gravity.player = self
	anim = get_node("AnimationPlayer")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += Gravity.currentGravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity -= Gravity.currentGravity * 0.3
		anim.play("hyppy")
	if velocity.y == 0:
		anim.play("idle")
	elif velocity.y > 0:
		anim.play("fall")
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		# The checks for current gravitys x or y values are there for checking
		# if the gravity is working in horizontal or vertical direction
		# and based on that the character running/walking movement is changed 
		if Gravity.currentGravity.y != 0:
			velocity.x = direction * SPEED
		elif Gravity.currentGravity.x != 0:
			velocity.y = direction * SPEED
	else:
		print(Gravity.currentGravityDirection)
		if Gravity.currentGravity.y != 0:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		elif Gravity.currentGravity.x != 0:
			velocity.y = move_toward(velocity.y, 0, SPEED)
				
	move_and_slide()
	
	if Gravity.isRotating:
		Gravity.rotate()

	if Input.is_action_just_pressed("ui_gravity_left") or Input.is_action_just_pressed("ui_gravity_right"):
		Gravity.rotate()
	
