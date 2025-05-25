extends Node2D

var start_x = 40
var start_y = 127

var player_scene = preload("res://player.tscn")

@export var trigger_position: Vector2 = Vector2(17 * 16, 5 * 16)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_instance = player_scene.instantiate()
	add_child(player_instance)
	var start_position = Vector2(start_x, start_y)
	player_instance.set_start_position(start_position)
	
	# Set the position of the Area2D trigger dynamically
	var trigger_node = $level_exit
	trigger_node.global_position = trigger_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#func _on_level_exit_body_entered(body: Node2D) -> void:
	#await get_tree().create_timer(1.0).timeout
	#get_tree().change_scene_to_file("res://level_1.tscn")


func _on_level_exit_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://level_1.tscn")
