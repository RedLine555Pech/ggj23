extends Node

var effectDistionary = {
	'FlyDie': preload("res://src/effects/FlyDie.tscn"),
}
	
func instantiateEffect(effectName: String, position: Vector2, direction:= Vector2(1,1)) -> void:
	var effect = effectDistionary[effectName];
	if !(effect):
		print('VisualEffectManager: effect '+effectName+' not found')
		return
	var instance = effect.instance();
	get_node("/root/World").call_deferred('add_child', instance);
	instance.global_position = position;
	instance.scale *= direction;
