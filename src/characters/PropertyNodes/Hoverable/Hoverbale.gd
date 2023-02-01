extends Area2D

signal on_hover_started
signal on_hover_finished

func _on_Hoverable_mouse_entered() -> void:
	emit_signal("on_hover_started")


func _on_Hoverable_mouse_exited() -> void:
		emit_signal("on_hover_finished")
