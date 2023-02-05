extends BaseMoving

export var spawn: String

func on_drag_started() -> void:
	if !is_active:
		return
	AudioManager.play_sound("ChickenScream")
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
		GameManager.DRAGGING_OBJECT = false;
		obj.on_drag_finished()
		obj.is_active = false;
		obj.hide();
		yield(get_tree().create_timer(1), "timeout");
		obj.is_active = true;
		obj.show();
		$AnimationPlayer.play("idle");
		is_active = true;
		can_move = true;

func on_stop():
	AudioManager.play_sound("Chicken")
	$AnimationPlayer.play("idle");
	
func on_move():
	$AnimationPlayer.play("walk");


func _on_EggTimer_timeout() -> void:
	if is_active && spawn:
		GameManager.spawn(spawn, position);
