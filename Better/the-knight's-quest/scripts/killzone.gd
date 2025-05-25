extends Area2D

@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../Player"  # or use body from the signal

var stored_body: Node2D = null  # store the body until timer fires

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		stored_body = body
		timer.start()
		Engine.time_scale = 0.5
		var shape = body.get_node("CollisionShape2D")
		if shape:
			shape.disabled = true  # ✅ just disable, don’t delete

func _on_timer_timeout() -> void:
	if stored_body and stored_body.has_method("respawn"):
		stored_body.respawn()
	Engine.time_scale = 1
