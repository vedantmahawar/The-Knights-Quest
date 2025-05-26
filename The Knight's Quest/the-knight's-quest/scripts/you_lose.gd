extends Label

# Variable for timer
@onready var timer: Label = $"../Timer"
# Delay to quit the game after player loses
var quit_delay = 4.0  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false

# Checks if the timer is less than 0
func _process(delta: float):
	if Global.timer < 0:
		# Hides the timer
		timer.visible = false
		# Shows the "You Lose" node
		$".".visible = true
		quit_delay -= delta
		# Quits the game once the delay is up as the player lost
		if quit_delay <= 0:
			get_tree().quit()
		
