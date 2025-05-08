extends CharacterBody2D

# Define constants
const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Var to store start position
var _start_position: Vector2 = Vector2.ZERO

# Reference to animation
@onready var animation = $animation

# Start position setter function
func set_start_position(pos: Vector2) -> void:
	_start_position = pos
	global_position = pos  

# Start position getter function 
func get_start_position() -> Vector2:
	return _start_position

func _ready() -> void:
	# If no start position was set externally, default to current position
	if _start_position == Vector2.ZERO:
		set_start_position(global_position) 
	# animation.scale = Vector2(0.9, 0.9)

func _physics_process(delta: float) -> void:
	# Get gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle movement and animation in one block
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = direction * SPEED
		animation.play("run")
		animation.flip_h = direction < 0  # Flip the sprite if moving left
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("idle")

	move_and_slide()
