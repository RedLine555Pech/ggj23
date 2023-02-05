extends Node2D


func _ready() -> void:
	yield(get_tree().create_timer(60), "timeout");
	GameManager.spawn('Fly', Vector2(-50, 500))
	yield(get_tree().create_timer(60), "timeout");
	GameManager.spawn('BlackHole', Vector2(90, 250), false)
	GameManager.emit_signal('blackhole_spawned', Vector2(90, 250));
	

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_Q):
		get_tree().quit()


func _on_Button_pressed() -> void:
	get_tree().quit()
