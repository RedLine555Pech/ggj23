extends BaseMoving

func on_drag_started() -> void:
	$Sprite.modulate = Color(0,1,0);
	.on_drag_started()

func on_drag_finished() -> void:
	$Sprite.modulate = Color(1,1,1);
	.on_drag_finished()

func on_interaction(obj: BaseCharacter) -> void:
	if obj.type == GE.OBJS.EGG && !is_dragging:
		$Sprite.modulate = Color(0,0,0);
		
func on_hover_started():
	$Sprite.modulate = Color(0,0,1);


func on_hover_finished():
	$Sprite.modulate = Color(1,1,1);
