extends Control

@onready var load_button: Button = get_node("CenterContainer/VBoxContainer/LoadButton")
@onready var credits: Panel = get_node("Credits")

func _ready():
	if not FileAccess.file_exists("user://savegame.save"): 
		load_button.disabled = true
		pass

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_load_button_pressed():
	pass # Replace with function body.


func _on_options_button_pressed():
	pass # Replace with function body.

func _on_credits_button_pressed():
	credits.visible = true

func _on_exit_button_pressed():
	get_tree().quit()


func _on_hide_credits_button_pressed():
	credits.visible = false
