extends Area2D

signal on_drag_started
signal on_drag_finished

var is_selected = false;
	
func _on_Dragable_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_action("left_click") && !event.is_echo():
		if event.pressed:
			is_selected = true;
			emit_signal("on_drag_started");
		elif is_selected:
			is_selected = false;
			emit_signal("on_drag_finished");
