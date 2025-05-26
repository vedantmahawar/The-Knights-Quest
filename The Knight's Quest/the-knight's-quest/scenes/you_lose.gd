extends Label

@onready var timer: Label = $"../Timer"
var quit_delay = 5.0  # seconds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false

func _process(delta: float):
	if Global.timer < 0:
		timer.visible = false
		$".".visible = true
		quit_delay -= delta
		if quit_delay <= 0:
			get_tree().quit()
		
