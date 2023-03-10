extends BaseCharacter

class_name BaseMoving

export var speed:= 100;
export var idle_time:= 2.0;

var can_move = false;
var target_point = Vector2.ZERO;

func _ready() -> void:
	$IdleTimer.wait_time = idle_time;
	$IdleTimer.start();
	on_stop();
	

func ai(delta: float):
	if !can_move || !is_active:
		return
	if target_point == self.global_position:
		scale.x = 1;		
		$IdleTimer.start();
		on_stop();
		can_move = false;
	else:
		on_move();
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
	if target_point.x < global_position.x:
		scale.x = -1
	else:
		scale.x = 1;
	
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
	
func on_stop():
	pass
	
func on_move():
	pass
