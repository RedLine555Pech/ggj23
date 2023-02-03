extends BaseCharacter

func on_drag_started() -> void:
	$Sprite.modulate = Color(0,1,0);
	.on_drag_started()


func on_drag_finished() -> void:
	$Sprite.modulate = Color(1,1,1);
	.on_drag_finished()


func on_interaction(obj: BaseCharacter) -> void:
	if not state == STATES.DRAGGING: return
	
	if obj.type == GE.OBJS.CHICKEN:
		queue_free();
