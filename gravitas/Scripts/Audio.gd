extends AudioStreamPlayer

const BG_MUSIC = preload("res://Assets/Gravitas_assets/cool-retro-darkwavesynthwave-type-beat-shadows-211527.wav")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
	

func play_music_level():
	_play_music(BG_MUSIC) 
