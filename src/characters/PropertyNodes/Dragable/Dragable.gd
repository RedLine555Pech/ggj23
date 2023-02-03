extends Area2D

signal on_drag_started
signal on_drag_finished

var is_selected = false;
var drag_sensitivity := 1

func _on_Dragable_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_action("left_click") && !event.is_echo():
		if event.pressed:
			is_selected = true;
		elif is_selected:
			is_selected = false;
			emit_signal("on_drag_finished");

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and is_selected:
		if event.relative.length() > drag_sensitivity:
			emit_signal("on_drag_started");
