extends Node2D


func _ready() -> void:
	yield(get_tree().create_timer(60), "timeout");
	GameManager.spawn('Fly', Vector2(-50, 500))
