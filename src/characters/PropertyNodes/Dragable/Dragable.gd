extends Area2D

signal on_drag_started
signal on_dragging
signal on_drag_finished

var is_selected = false;
var is_dragging = false;
var drag_sensitivity := 1

func _on_Dragable_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_action("left_click") && !event.is_echo():
		if event.pressed:
			is_selected = true;
			emit_signal("on_drag_started");
		elif is_selected:
			is_selected = false;
			is_dragging = false;
			emit_signal("on_drag_finished");

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and is_selected and !is_dragging:
		if event.relative.length() > drag_sensitivity:
			is_dragging = true
			emit_signal("on_dragging");
