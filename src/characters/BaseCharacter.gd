extends Node2D

class_name BaseCharacter

enum STATES {
	IDLE,
	START_DRAGGING,
	DRAGGING
}

var state: int = STATES.IDLE;
var drag_sensitivity := 1
var prev_pos := Vector2.ZERO;
export(GE.OBJS) var type := GE.OBJS.EGG

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
		clickable.connect("on_clicked", self, "on_clicked")
		clickable.connect("on_unclicked", self, "on_unclicked")
		
func followMouse():
	global_position = get_global_mouse_position();

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and state == STATES.START_DRAGGING:
		if event.relative.length() > drag_sensitivity:
			change_state(STATES.DRAGGING)

func _process(delta: float) -> void:
	if state == STATES.DRAGGING:
		followMouse()
	ai(delta);
	rotate_on_drag(delta);

func ai(delta: float):
	pass;
	
func rotate_on_drag(delta: float):
	if state == STATES.IDLE:
		rotation_degrees = 0;
		return
	else:
		rotation_degrees = 30 * (global_position.x - prev_pos.x) / 30;
		prev_pos = global_position;
		
func on_clicked():
	pass

func on_unclicked():
	change_state(STATES.IDLE)
	
func on_drag_started():
	change_state(STATES.START_DRAGGING)
	prev_pos = global_position
	

func on_drag_finished():
	change_state(STATES.IDLE)


func on_click():
	print("Real click")
	pass


func on_hover_started():
	pass


func on_hover_finished():
	pass

func on_interaction(obj: BaseCharacter) -> void:
	pass

func change_state(new_state: int):
	if state == STATES.START_DRAGGING and new_state == STATES.IDLE:
		on_click()
	
	state = new_state
