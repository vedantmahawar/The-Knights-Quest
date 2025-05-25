extends Area2D

@export var coin_id: String
@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# If coin has already been collected, don't show it again
func _ready():
	if coin_id in Global.collected_coin_ids:
		queue_free()
		
# When coin is collected by player
# Put them both on a different physics layer (#2) so this only triggers w/ the player
func _on_body_entered(body: Node2D) -> void:
	game_manager.coin_collect()
	Global.coins += 1
	# Save this coin as collected
	Global.collected_coin_ids.append(coin_id)
	# Remove coin from scene
	animation_player.play("pickup")
