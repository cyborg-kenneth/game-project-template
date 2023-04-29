extends Control

@onready var start_button: Button = get_node("CenterContainer/MainContainer/StartButton")
@onready var load_button: Button = get_node("CenterContainer/MainContainer/LoadButton")

var savegame_path: String = "user://savegame.save"

func _ready():
	start_button.grab_focus()
	if not FileAccess.file_exists(savegame_path): 
		load_button.disabled = true

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_load_button_pressed():
	pass # Replace with function body.

func _on_options_button_pressed():
	pass # Replace with function body.

func _on_credits_button_pressed():
	pass # Replace with function body.

func _on_quit_button_pressed():
	get_tree().quit()
