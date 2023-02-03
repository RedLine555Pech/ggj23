extends Area2D

signal on_clicked
signal on_unclicked

func _on_Clickable_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_action("left_click"):
		if event.is_action_pressed("left_click"):
			emit_signal("on_clicked")
		elif event.is_action_released("left_click"):
			emit_signal("on_unclicked")
