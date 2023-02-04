extends BaseCharacter

export var on_tree: bool = false
export var damage_over_time = true;
export var health: int = 3
export var spawn: PackedScene

func _ready() -> void:
	if !on_tree && damage_over_time:
		$DamageTimer.start();

func on_drag_started() -> void:
	if !is_active: return
	if on_tree:
		$AnimationPlayer.play("shake");
		return
	elif damage_over_time:
		$DamageTimer.stop();
	.on_drag_started()


func on_drag_finished() -> void:
	if !is_active: return
	if on_tree:
		$AnimationPlayer.play("shake");
		return
	elif damage_over_time:
		$DamageTimer.start();
	.on_drag_finished()


func on_interaction(obj: BaseCharacter) -> void:
	if is_active && obj.is_active && (obj.type == GE.OBJS.DUCK || obj.type == GE.OBJS.CHICKEN) && is_dragging:
		GameManager.DRAGGING_OBJECT = false;
		queue_free();

func on_clicked():
	if !is_active: return
	if on_tree:
		$AnimationPlayer.play("shake");
		return		
	elif damage_over_time:
		$DamageTimer.start();
	.on_clicked()
	damage()


func fall():
	var g_pos = global_position;
	var world = get_parent().get_parent();
	get_parent().remove_child(self);
	world.add_child(self);
	self.position = g_pos;
	yield(get_tree().create_timer(0.2), "timeout")
	on_tree = false
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", global_position + Vector2(0, 500+randf()*200), 0.5)
		
	yield(tween, "finished")
	damage()
	if damage_over_time:
		$DamageTimer.start();


func damage():
	health = clamp(health - 1, 0, health)
	print("Damaged" + str(health))
	$Sprite.frame += 1;
	$AnimationPlayer.play("shake");
	if health <= 0:
		kill()


func kill():
	print("Killed")
	is_active = false;
	$Sprite.frame = 4;	
	if spawn:
		var obj: Node2D = spawn.instance()
		obj.scale = Vector2(0.2, 0.2);
		obj.position = position
		get_parent().add_child(obj)
		
		var tween = get_tree().create_tween()
		tween.tween_property(obj, "scale", Vector2(1, 1), 0.5)
		
		yield(tween, "finished")
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,0), 0.5)
	yield(tween, "finished")
	
	queue_free()
	


func _on_DamageTimer_timeout() -> void:
	if is_active:
		damage()
