extends Node2D

var start_x = 40
var start_y = 127

var player_scene = preload("res://player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_instance = player_scene.instantiate()
	add_child(player_instance)
	var start_position = Vector2(start_x, start_y)
	player_instance.set_start_position(start_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
