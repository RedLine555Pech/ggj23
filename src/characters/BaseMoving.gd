extends BaseCharacter

class_name BaseMoving

export var speed:= 100;
export var idle_time:= 2;

var can_move = true;
var target_point = Vector2.ZERO;

func _ready() -> void:
	new_target_point();
	$IdleTimer.wait_time = idle_time;

func ai(delta: float):
	if !can_move:
		return
	if target_point == self.global_position:
		$IdleTimer.start();
		can_move = false;
	var move_vec = target_point - self.global_position;
	var move_vec_delta = move_vec.normalized() * speed * delta;
	if move_vec.length() <= move_vec_delta.length():
		self.global_position += move_vec;
	else:
		self.global_position += move_vec_delta
	
func new_target_point():
	var x = ((randi() % (GameManager.RIGHT_BORDER - GameManager.LEFT_BORDER)) + GameManager.LEFT_BORDER);
	var y = ((randi() % (GameManager.BOTTOM_BORDER - GameManager.TOP_BORDER)) + GameManager.TOP_BORDER);
	target_point = Vector2(x, y)
	
func on_drag_started() -> void:
	can_move = false;
	$IdleTimer.stop();
	.on_drag_started()

func on_drag_finished() -> void:
	new_target_point();
	can_move = true;
	.on_drag_finished()
	
func _on_IdleTimer_timeout() -> void:
	new_target_point();
	can_move = true;
	
