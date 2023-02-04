extends Panel

export(NodePath) onready var label = get_node(label) as Label

onready var animation = $AnimationPlayer
onready var timer = $ShowTimer

func _ready() -> void:
	Achievements.connect("get_achievement", self, "get_achievement")


func get_achievement(name: String) -> void:
	label.text = name
	animation.play("show")
	timer.start()


func _on_ShowTimer_timeout() -> void:
	animation.play_backwards("show")
