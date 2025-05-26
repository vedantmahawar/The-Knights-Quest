extends Area2D

# Sprite 2D Variable
@onready var sprite_2d: Sprite2D = $Sprite2D
# Checks if the checkpoint has already been removed
var freed = false

# When player reaches checkpoint
func _on_body_entered(body: Node2D) -> void:
	# Set checkpoint
	body.set_checkpoint(global_position)
	# Remove from scene if it already ahsnt been removed
	if freed == false:
		sprite_2d.queue_free()
		freed = true
