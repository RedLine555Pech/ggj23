extends Node2D

class_name BaseCharacter

var is_blackhole_spawned = false;
var bh_speed = 30;
export var is_blackhole_immune = false;
var bh_pos = Vector2.ZERO;
var is_dragging = false;
var is_active = true;
var prev_pos = Vector2.ZERO;
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
		clickable.connect("on_clicked", self, "on_clicked");
	GameManager.connect("blackhole_spawned", self, "blackhole_spawned");
		
func blackhole_spawned(pos): 
	if is_blackhole_immune:
		return
	is_active = false;
	is_blackhole_spawned = true;
	bh_pos = pos;
	
func followMouse():
	global_position.x = clamp(get_global_mouse_position().x, GameManager.LEFT_BORDER, GameManager.RIGHT_BORDER);
	global_position.y = clamp(get_global_mouse_position().y, GameManager.TOP_BORDER, GameManager.BOTTOM_BORDER);

func _process(delta: float) -> void:
	if is_dragging:
		followMouse()
	ai(delta);
	rotate_on_drag(delta);
	move_in_blackhole(delta);
	
func move_in_blackhole(delta):
	if is_blackhole_spawned:
		var move_vec = bh_pos - self.global_position;
		var move_vec_delta = move_vec.normalized() * bh_speed * delta;
		if move_vec.length() <= move_vec_delta.length():
			self.global_position += move_vec;
			queue_free();
		else:
			self.global_position += move_vec_delta
		bh_speed *= 1.03
		
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
	modulate = Color(1, 1, 0.7, 1)


func on_hover_finished():
	modulate = Color(1, 1, 1, 1)

func on_interaction(obj: BaseCharacter) -> void:
	pass
