extends Node

enum OBJS {
	EGG,
	CHICKEN
}

func e_print(enum_value: int) -> void:
	print(GE.OBJS.keys()[enum_value])
