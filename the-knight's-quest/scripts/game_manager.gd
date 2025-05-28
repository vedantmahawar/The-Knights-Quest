extends Node

# Variable to deincrement timer
var time_passed := 0.0

# Label for the timer which is stuck to the player
@onready var timer_label: Label = $"../Player/Timer"

func _process(delta: float):
	# Constantly update timer
	timer_label.text = str(Global.timer) + "s"
	# Every second deincrement the timer
	time_passed += delta
	if time_passed >= 1.0:
		time_passed = 0.0
		Global.timer += -1

# If a coin is collected increment the timer back up
func coin_collect():
	Global.timer += 10
	
