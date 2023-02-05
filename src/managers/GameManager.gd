extends Node

const LEFT_BORDER = 400;
const RIGHT_BORDER = 1520;
const TOP_BORDER = 300;
const BOTTOM_BORDER = 880;

var DRAGGING_OBJECT = false;

var prefabDistionary = {
	'Fly': preload("res://src/characters/Fly/Fly.tscn"),
	'EggChicken': preload("res://src/characters/Egg/Egg.tscn"),
	'EggDuck': preload("res://src/characters/Egg/EggDuck.tscn"),
	'EggCoolDuck': preload("res://src/characters/Egg/EggCoolDuck.tscn"),
	'Chicken': preload("res://src/characters/Chicken/Chicken.tscn"),
	'ChickenFirst': preload("res://src/characters/Chicken/ChickenFirst.tscn"),
	'Duck': preload("res://src/characters/Duck/Duck.tscn"),
	'CoolDuck': preload("res://src/characters/Duck/CoolDuck.tscn"),
	'Flag': preload("res://src/characters/Flag/Flag.tscn"),
}

func _ready() -> void:
	randomize()


func spawn(name, pos):
	var instance = prefabDistionary[name];
	if instance:
		var obj: Node2D = instance.instance()
		obj.scale = Vector2(0.2, 0.2);
		obj.position = pos
		get_node("/root/World").add_child(obj)
		
		var tween = get_tree().create_tween()
		tween.tween_property(obj, "scale", Vector2(1, 1), 0.5)
		
		yield(tween, "finished")
