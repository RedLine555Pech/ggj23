extends BaseCharacter

export var on_tree: bool = false
export var breakable: bool = false
export var health: int = 3
export var spawn: PackedScene

func on_drag_started() -> void:
	$Sprite.modulate = Color(0,1,0);
	.on_drag_started()


func on_drag_finished() -> void:
	$Sprite.modulate = Color(1,1,1);
	.on_drag_finished()


func on_interaction(obj: BaseCharacter) -> void:
	if obj.type == GE.OBJS.CHICKEN && is_dragging:
		queue_free();

func on_clicked():
	if on_tree: return
	
	.on_clicked()
	damage()


func fall():
	yield(get_tree().create_timer(1), "timeout")
	on_tree = false
	
	if breakable:
		kill()
	else:
		damage()


func damage():
	health = clamp(health - 1, 0, health)
	print("Damaged" + str(health))
	
	if health <= 0:
		kill()


func kill():
	print("Killed")
	
	if spawn:
		var obj: Node2D = spawn.instance()
		obj.scale = Vector2.ZERO
		obj.position = position
		get_parent().add_child(obj)
		
		var tween = get_tree().create_tween()
		tween.tween_property(obj, "scale", Vector2(1, 1), 0.5)
		
		yield(tween, "finished")
	
	queue_free()
	
