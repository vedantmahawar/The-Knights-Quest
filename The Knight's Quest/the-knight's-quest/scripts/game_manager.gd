extends Node

var time_passed := 0.0

@onready var timer_label: Label = $"../Player/Timer"

func _process(delta: float):
	# Constantly update timer
	timer_label.text = str(Global.timer) + "s"
	# Every second increment the timer
	time_passed += delta
	if time_passed >= 1.0:
		time_passed = 0.0
		Global.timer += -1

func coin_collect():
	Global.timer += 10
	
