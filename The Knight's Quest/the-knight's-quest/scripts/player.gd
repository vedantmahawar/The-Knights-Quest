extends CharacterBody2D

# Definse constats
const SPEED = 100
const JUMP_VELOCITY = -300

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var current_checkpoint: Vector2 = Vector2.ZERO

func set_checkpoint(pos: Vector2):
	current_checkpoint = pos

func respawn():
	global_position = current_checkpoint
	velocity = Vector2.ZERO
	var shape = get_node("CollisionShape2D")
	if shape:
		shape.disabled = false  # ✅ re-enable collision

# Do the physics
func _physics_process(delta: float) -> void:
	# Add the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction 
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flips sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	# Play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
	
	# Applies the movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
