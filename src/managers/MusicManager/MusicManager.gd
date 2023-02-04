extends Node2D

var current_music
var audioDistionary = {
#	'Epic': load("res://music/background_music/Event Music 2.ogg"),
}

func _process(delta: float) -> void:
	if !$AudioStreamPlayer.playing:
		$AudioStreamPlayer.play();

func turn_music(music_name):
	if current_music == music_name:
		return
	var music = audioDistionary[music_name];
	if music:
		current_music = music_name;
		$AudioStreamPlayer.stream = music;
		$AudioStreamPlayer.play();
