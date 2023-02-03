extends Area2D

signal on_clicked

var mouse_moved = false;
var left_clicked = false;

func _on_Clickable_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_action_pressed("left_click"):
		left_clicked = true;
		mouse_moved = false;
	elif left_clicked && !mouse_moved && event is InputEventMouseButton && event.is_action_released("left_click"):
		left_clicked = false;
		emit_signal("on_clicked")	
	elif left_clicked && event is InputEventMouseMotion:
		mouse_moved = true;
		
