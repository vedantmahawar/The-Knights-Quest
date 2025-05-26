extends Node2D

const SPEED = 50

var direction = 1

@onready var ray_cast_right: RayCast2D = $"RayCast Right"
@onready var ray_cast_left: RayCast2D = $"RayCast Left"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
		
	position.x += direction * SPEED * delta
	
