extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const NULL_VECTOR = Vector2(0, 0)
var anim

func _ready() -> void:
	Gravity.player = self
	anim=get_node("AnimationPlayer")

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
		velocity -= Gravity.currentGravity * 0.3
		anim.play("hyppy")
	if velocity.y ==0:
		anim.play("idle")
	elif velocity.y >0:
		anim.play("fall")
	
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("ui_left"):
		velocity = Vector2(-Gravity.currentGravity.y, Gravity.currentGravity.x) * 0.3
	elif Input.is_action_just_pressed("ui_right"):
		velocity = Vector2(Gravity.currentGravity.y, -Gravity.currentGravity.x) * 0.3
	
	move_and_slide()
	
	if Gravity.isRotating:
		Gravity.rotate()

	if Input.is_action_just_pressed("ui_gravity_left") or Input.is_action_just_pressed("ui_gravity_right"):
		Gravity.rotate()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
