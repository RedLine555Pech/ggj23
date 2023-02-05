extends "res://src/characters/Duck/Duck.gd"
var attempts = 3;

func on_drag_started() -> void:
	if !is_active:
		return
	knife_play()
	
func on_hover_started():
	.on_hover_started()
	if !is_active || GameManager.DRAGGING_OBJECT:
		return
	if !is_dragging:
		can_move = false;
		$IdleTimer.stop();
		$AnimationPlayer.play("knife_out");


func on_hover_finished():
	.on_hover_finished()
	if !is_active || GameManager.DRAGGING_OBJECT:
		return
	if !is_dragging:
		new_target_point();
		can_move = true;		
		$AnimationPlayer.play("idle");
		
func on_clicked():
	if !is_active || GameManager.DRAGGING_OBJECT:
		return
	knife_play()
	
func knife_play():
	if attempts == -1:
		return;
	elif attempts == 0:
		scale.x = 1;
		can_move = false;
		$IdleTimer.stop();
		$AnimationPlayer.play("flag");
		attempts -= 1;
		yield(get_tree().create_timer(1), "timeout");
		GameManager.spawn('Flag', global_position + Vector2(80, 0))
		can_move = true;		
		$AnimationPlayer.play("idle");
	else:
		can_move = false;
		$IdleTimer.stop();
		$AnimationPlayer.play("knife_play");
		attempts -= 1;
