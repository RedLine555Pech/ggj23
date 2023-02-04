extends VBoxContainer

var is_show: bool = false

func _ready() -> void:
	$AnimationPlayer.play("RESET")

func _on_TextureButton_pressed() -> void:
	if is_show:
		$AnimationPlayer.play_backwards("show")
	else:
		$AnimationPlayer.play("show")
	
	is_show = !is_show
