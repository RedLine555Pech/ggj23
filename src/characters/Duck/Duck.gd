extends BaseMoving

func on_drag_started() -> void:
	if !is_active:
		return
	$AnimationPlayer.play("hang");
	.on_drag_started()

func on_drag_finished() -> void:
	if !is_active:
		return
	$AnimationPlayer.play("idle");
	.on_drag_finished()

func on_interaction(obj: BaseCharacter) -> void:
	if !is_active:
		return
	if obj.is_active && obj.type == GE.OBJS.EGG && obj.is_dragging && !is_dragging:
		is_active = false;
		can_move = false;
		$IdleTimer.stop();
		$AnimationPlayer.play("eyes_out");
		yield(get_tree().create_timer(1), "timeout");
		$AnimationPlayer.play("idle");
		is_active = true;
		can_move = true;
		
		
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
		can_move = true;		
		$AnimationPlayer.play("idle");

func on_stop():
	$AnimationPlayer.play("idle");
	
func on_move():
	$AnimationPlayer.play("walk");
