extends Node2D

# Sets movement speed
const SPEED = 50

# Direction so the slimes can flip
var direction = 1

# Uses raycasts so the slimes move between walls
@onready var ray_cast_right: RayCast2D = $"RayCast Right"
@onready var ray_cast_left: RayCast2D = $"RayCast Left"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Updates the direction
func _process(delta: float):
	if ray_cast_right.is_colliding():
		# Updates direction
		direction = -1
		# Flips the slime
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		# Updates direction
		direction = 1
		# Flips the slime
		animated_sprite_2d.flip_h = false
	
	# Moves the slime
	position.x += direction * SPEED * delta
	
