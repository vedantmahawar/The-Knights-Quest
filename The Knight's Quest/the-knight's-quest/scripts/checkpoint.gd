extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
var freed = false

func _on_body_entered(body: Node2D) -> void:
	body.set_checkpoint(global_position)
	if freed == false:
		sprite_2d.queue_free()
		freed = true
