extends Node

enum OBJS {
	EGG,
	CHICKEN
}

func obj_print(enum_value: int) -> void:
	print(OBJS.keys()[enum_value])
