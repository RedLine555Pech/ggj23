extends Area2D

signal on_clicked

func _on_Clickable_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_action("left_click"):
		emit_signal("on_clicked")
