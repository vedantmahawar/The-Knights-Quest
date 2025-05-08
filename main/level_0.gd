extends Node2D

var start_x = 200
var start_y = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_node = $player 
	var start_position = Vector2(start_x, start_y) 
	player_node.set_start_position(start_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
