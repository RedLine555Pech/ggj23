extends Node

signal get_achievement(name)

enum {
	TEST,
	TEST2
}

var achiements: Dictionary = {
	TEST: {
		"name": "First test",
		"collected": false
	},
	TEST2: {
		"name": "Second test",
		"collected": false
	}
}


func collect(achievement: int) -> void:
	achiements[achievement].collected = true
	emit_signal("get_achievement", achiements[achievement].name)
	
