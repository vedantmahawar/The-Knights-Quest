extends Area2D

# Variables
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../Player"  

# Store the body till timer fires
var stored_body: Node2D = null  

# When player dies
func _on_body_entered(body: Node2D) -> void:
	# If it is the player (and not a slime or something)
	if body.name == "Player":
		stored_body = body
		# Start the timer till the player is teleported back to the checkpoint
		timer.start()
		# Slow everything down for dramatic effect
		Engine.time_scale = 0.5
		# Disable the collision shape to not mess anything up
		var shape = body.get_node("CollisionShape2D")
		if shape:
			shape.disabled = true  

# When player is set to respawn
func _on_timer_timeout() -> void:
	# Redundancy check to make sure it is player
	# Allows for scalability within the game
	if stored_body and stored_body.has_method("respawn"):
		# Respawn player
		stored_body.respawn()
	# Speed everything back up again
	Engine.time_scale = 1
