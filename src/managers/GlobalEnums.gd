extends Node

enum OBJS {
	EGG,
	CHICKEN,
	DUCK,
	HOLE
}

func obj_print(enum_value: int) -> void:
	print(OBJS.keys()[enum_value])
