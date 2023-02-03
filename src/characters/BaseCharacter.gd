extends Node2D

class_name BaseCharacter

var is_dragging = false;
var prev_pos = Vector2.ZERO;
export var type = "EGG"

func _ready() -> void:
	var dragable = get_node_or_null("Dragable")
	if dragable:
		dragable.connect("on_drag_started", self, "on_drag_started");
		dragable.connect("on_drag_finished", self, "on_drag_finished");
	var hoverable = get_node_or_null("Hoverable")
	if hoverable:
		hoverable.connect("on_hover_started", self, "on_hover_started");
		hoverable.connect("on_hover_finished", self, "on_hover_finished");
	var interactable = get_node_or_null("Interactable")
	if interactable:
		interactable.connect("on_interaction", self, "on_interaction");
	var clickable = get_node_or_null("Clickable")
	if clickable:
		clickable.connect("on_clicked", self, "on_clicked");
		
func followMouse():
	global_position = get_global_mouse_position();

func _process(delta: float) -> void:
	if is_dragging:
		followMouse()
	ai(delta);
	rotate_on_drag(delta);

func ai(delta: float):
	pass;
	
func rotate_on_drag(delta: float):
	if !is_dragging:
		rotation_degrees = 0;
		return
	else:
		rotation_degrees = 30 * (global_position.x - prev_pos.x) / 30;
		prev_pos = global_position;
		
func on_clicked():
	pass
	
func on_drag_started():
	is_dragging = true;
	prev_pos = global_position;
	

func on_drag_finished():
	is_dragging = false;


func on_click():
	pass


func on_hover_started():
	pass


func on_hover_finished():
	pass

func on_interaction(obj: BaseCharacter):
	pass
