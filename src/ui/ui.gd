extends Control

export(NodePath) onready var dialog = get_node(dialog) as Dialog
export(Array, Resource) var dialogues: Array

var idx: int = 0

func _ready() -> void:
	dialog.connect("choose", self, "choosed")
	
	run_dialog()

func run_dialog() -> void:
	dialog.start_dialog(dialogues[idx])

func choosed(dialog_id: int, answer_id: int) -> void:
	print("Dialog: " + str(dialog_id) + " Answer: " + str(answer_id))
	
	if idx < dialogues.size() - 1:
		idx += 1
		run_dialog()
