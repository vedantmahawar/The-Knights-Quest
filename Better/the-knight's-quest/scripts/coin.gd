extends Area2D

# When coin is collected by player
# Put them both on a different physics layer (#2) so this only triggers w/ the player
func _on_body_entered(body: Node2D) -> void:
	# Remove coin
	queue_free()
