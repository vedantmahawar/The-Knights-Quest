extends Area2D

@onready var timer: Timer = $Timer

# Function to start timer
func _on_body_entered(body: Node2D) -> void:
	timer.start()

# Function to restart game
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
