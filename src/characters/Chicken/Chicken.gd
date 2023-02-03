extends BaseMoving

func on_drag_started() -> void:
	$Sprite.modulate = Color(0,1,0);
	.on_drag_started()

func on_drag_finished() -> void:
	$Sprite.modulate = Color(1,1,1);
	.on_drag_finished()

func on_interaction(obj: BaseCharacter) -> void:
	print(obj.type)
	print(is_dragging)
	if obj.type == "EGG" && !is_dragging:
		$Sprite.modulate = Color(0,0,0);
		
func on_clicked():
	$Sprite.modulate = Color(0,0,1);
