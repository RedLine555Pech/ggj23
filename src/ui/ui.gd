extends Control

export(NodePath) onready var dialog = get_node(dialog) as Dialog
export(Array, Resource) var dialogues: Array

var idx: int = 0

func _ready() -> void:
	dialog.connect("choose", self, "choosed")
	
	AchievementManager.reset_achievements()
	
	yield(get_tree().create_timer(1), "timeout")
	
	AchievementManager.unlock_achievement(Achievements.NAME.INSTANT)
	
#	run_dialog()

func run_dialog() -> void:
	dialog.start_dialog(dialogues[idx])

func choosed(dialog_id: int, answer_id: int) -> void:
	print("Dialog: " + str(dialog_id) + " Answer: " + str(answer_id))
	
	if dialog_id == 0:
		if answer_id == 1:
			next_dialog()
	

func next_dialog(step: int = 1) -> void:
	if idx + step <= dialogues.size() - 1:
		idx += step
		run_dialog()
	
