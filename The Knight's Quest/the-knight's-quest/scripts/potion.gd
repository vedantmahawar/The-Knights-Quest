extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
		
# When potion is collected by player
# Put them both on a different physics layer (#2) so this only triggers w/ the player
func _on_body_entered(body: Node2D) -> void:
	# Remove potion from scene
	queue_free()
