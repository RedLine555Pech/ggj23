extends BaseCharacter

var back_buffer;

func _ready() -> void:
	back_buffer = $BackBufferCopy

func on_interaction(obj: BaseCharacter) -> void:
	if obj.is_active && obj.is_dragging:
		call_deferred('push_in_hole', self, obj);
	
func push_in_hole(hole, obj):
	GameManager.DRAGGING_OBJECT = false;
	obj.on_drag_finished();
	obj.is_active = false;
	obj.get_parent().remove_child(obj);
	hole.back_buffer.add_child(obj);
	hole.back_buffer.move_child(obj, 0);
	obj.position = Vector2.ZERO;
	var tween = get_tree().create_tween();
	tween.tween_property(obj, "global_position", global_position + Vector2(0, 100), 1)
