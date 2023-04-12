extends Resource

class_name GameSettings

var SoundVolume: float = 1: set = set_sound_volume
var MusicVolume: float = 1: set = set_music_volume

signal sound_volume_changed(value)
signal music_volume_changed(value)

func set_sound_volume(value): 
	SoundVolume = clamp(value, 0, 1)
	emit_signal("sound_volume_changed", SoundVolume)
	
func set_music_volume(value): 
	MusicVolume = clamp(value, 0, 1)
	emit_signal("music_volume_changed", MusicVolume)
	ResourceLoader
