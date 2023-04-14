extends Control

@onready var load_button: Button = get_node("CenterContainer/VBoxContainer/LoadButton")
@onready var options: Panel = get_node("Options")
@onready var fullscreen_label: Label = get_node("Options/HBoxContainer/VBoxContainer/HBoxContainer/FullscreenLabel")
@onready var fullscreen_button: CheckButton = get_node("Options/HBoxContainer/VBoxContainer/HBoxContainer/FullscreenButton")
@onready var sound_slider: HSlider = get_node("Options/HBoxContainer/VBoxContainer/HBoxContainer2/SoundSlider")
@onready var music_slider: HSlider = get_node("Options/HBoxContainer/VBoxContainer/HBoxContainer3/MusicSlider")
@onready var credits: Panel = get_node("Credits")

var configuration_file: ConfigFile
var config_path = "user://settings.cfg"

var GameSettings = GlobalResourceLoader.GameSettings

func _ready():
	if not FileAccess.file_exists("user://savegame.save"): 
		load_button.disabled = true
	configuration_file = ConfigFile.new()
	configuration_file.set_value("graphics", "fullscreen", false)
	configuration_file.set_value("audio", "sound", 1)
	configuration_file.set_value("audio", "music", 1)
	var err = configuration_file.load(config_path)
	if err != OK: 
		print(err)
		return
	else: 
		load_settings()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_load_button_pressed():
	pass # Replace with function body.


func _on_options_button_pressed():
	options.visible = true

func _on_credits_button_pressed():
	credits.visible = true

func _on_exit_button_pressed():
	get_tree().quit()


func _on_hide_credits_button_pressed():
	credits.visible = false

func _on_fullscreen_button_toggled(button_pressed):
	if button_pressed: 
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		fullscreen_label.text = "Fullscreen: On"
	else: 
		fullscreen_label.text = "Fullscreen: Off"
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_sound_slider_drag_ended(value_changed):
	if value_changed: 
		pass

func _on_music_slider_drag_ended(value_changed):
	pass # Replace with function body.

func _on_save_settings_button_pressed():
	configuration_file.set_value("graphics", "fullscreen", fullscreen_button.button_pressed)
	configuration_file.set_value("audio", "sound", sound_slider.value)
	configuration_file.set_value("audio", "music", music_slider.value)
	var err = configuration_file.save(config_path)
	if err == OK: 
		print("Succes")
	options.visible = false

func _on_cancel_settings_button_pressed():
	fullscreen_button.button_pressed = configuration_file.get_value("graphics", "fullscreen", false)
	sound_slider.value = configuration_file.get_value("audio", "sound", 1)
	music_slider.value = configuration_file.get_value("audio", "music", 1)
	options.visible = false
	
func load_settings(): 
	var fullscreen: bool =  configuration_file.get_value("graphics", "fullscreen", false)
	_on_fullscreen_button_toggled(fullscreen)
	fullscreen_button.button_pressed = fullscreen
	
	sound_slider.value = configuration_file.get_value("audio", "sound", 1)
	GameSettings.SoundVolume = sound_slider.value
	music_slider.value = configuration_file.get_value("audio", "music", 1)
	GameSettings.MusicVolume = music_slider.value
