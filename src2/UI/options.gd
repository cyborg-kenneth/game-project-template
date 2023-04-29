extends Panel

@onready var fullscreen_button: CheckButton = get_node("TabContainer/Graphics & Audio/FullscreenButton")
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fullscreen_button_toggled(button_pressed):
	if button_pressed: 
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		fullscreen_button.text = "Fullscreen: On"
	else: 
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		fullscreen_button.text = "Fullscreen: Off"
