extends Area2D

signal on_drag_started
signal on_drag_finished

var mouse_moved = false;
var left_clicked = false;

func _on_Dragable_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_action_pressed("left_click") && !event.is_echo():
		left_clicked = true;
		mouse_moved = false;
	elif !GameManager.DRAGGING_OBJECT && !mouse_moved && left_clicked && event is InputEventMouseMotion:
		mouse_moved = true;
		GameManager.DRAGGING_OBJECT = true
		emit_signal("on_drag_started");
	elif left_clicked && mouse_moved && event is InputEventMouseButton && event.is_action_released("left_click"):
		left_clicked = false;
		GameManager.DRAGGING_OBJECT = false
		emit_signal("on_drag_finished")
	elif event is InputEventMouseButton && event.is_action_released("left_click"):
		left_clicked = false;


func _on_Dragable_mouse_exited() -> void:
	if mouse_moved: return
	
	mouse_moved = false;
	left_clicked = false;
