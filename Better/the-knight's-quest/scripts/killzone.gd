extends Area2D

@onready var timer: Timer = $Timer

# Function on death
func _on_body_entered(body: Node2D) -> void:
	# Start timer to reset game
	timer.start()
	# Slow everything down
	Engine.time_scale = 0.5
	# Make player fall through world
	body.get_node("CollisionShape2D").queue_free()

# Function to restart game
func _on_timer_timeout() -> void:
	# Restart Game
	get_tree().reload_current_scene()
	# Speed everything back to the proper speed 
	Engine.time_scale = 1
