extends BaseMoving

func _ready() -> void:
	new_target_point();
	$IdleTimer.wait_time = idle_time;

func ai(delta: float):
	var move_vec = target_point - self.global_position;
	var move_vec_delta = move_vec.normalized() * speed * delta;
	if move_vec.length() <= move_vec_delta.length():
		self.global_position += move_vec;
	else:
		self.global_position += move_vec_delta
	
func new_target_point():
	var x = randf() * 200 - 100;
	var y = randf() * 200 - 100;
	target_point = get_global_mouse_position() + Vector2(x, y)
		
func on_clicked():
	queue_free()
	
func on_drag_started():
	GameManager.DRAGGING_OBJECT = false;
	queue_free();

func _on_IdleTimer_timeout() -> void:
	new_target_point();
