extends Node2D

var audioDistionary = {
	'Chicken': load("res://audio/chicken/chicken.wav"),
	'ChickenScream': load("res://audio/chicken/chicken_scream.wav"),
	'Duck': load("res://audio/duck/duck_1.wav"),
	'DuckScream': load("res://audio/duck/duck_scream.wav"),
	'EggDamage': load("res://audio/egg/egg_damage.wav"),
	'EggKill': load("res://audio/egg/egg_kill.wav"),
	'TreeShake': load("res://audio/tree/tree_shake.wav")
#	'SwordSwing': load("res://music/sword_swing.wav"),
#	'Jump': load("res://music/jump.wav"),
#	'Magic': load("res://music/magic.wav"),
#	'Shield': load("res://music/shield.wav"),
#	'Curse': load("res://music/curse.wav"),
#	'Block': load("res://music/block.wav"),
#	'HitPlayer': load("res://music/hitplayer.wav"),
#	'HitBug': load("res://music/hitbug.wav"),
#	'DeathPlayer': load("res://music/deathplayer.wav"),
}

var audio_streams = [];
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_streams = $AudioStreams.get_children();

func play_sound(sound_name) -> void:
	for audio_stream in audio_streams:
		var audio_stream_manager = audio_stream as AudioStreamPlayer;
		if !audio_stream_manager.playing:
			var sound = audioDistionary[sound_name];
			if sound:
				audio_stream_manager.stream = sound
				audio_stream_manager.play();
				return

