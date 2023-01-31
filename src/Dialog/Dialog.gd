extends VBoxContainer
class_name Dialog

export(PackedScene) var button_scene = preload("res://src/Dialog/dialogButton.tscn")

onready var label = $Label
onready var buttons_box = $HBoxContainer

signal choose(dialog_id, answer_id)

func _ready() -> void:
	hide()

func start_dialog(dialog: DialogResource):
	label.text = dialog.question
	
	generate_buttons(dialog.answers, dialog.id)
	
	show()


func generate_buttons(answers: Array, dialog_id: int) -> void:
	clear_buttons()
	
	for i in answers.size():
		var button: Button = button_scene.instance()
		button.text = answers[i]
		button.connect("pressed", self, "choose_option", [dialog_id, i])
		buttons_box.add_child(button)


func clear_buttons() -> void:
	for child in buttons_box.get_children():
		buttons_box.remove_child(child)


func choose_option(dialog_id: int, answer_id: int) -> void:
	emit_signal("choose", dialog_id, answer_id)
	hide()
