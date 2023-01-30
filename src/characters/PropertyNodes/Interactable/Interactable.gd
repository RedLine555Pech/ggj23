extends Area2D

signal on_interaction(obj)
export var filter_type: String;

func _on_Interactable_area_entered(area: Area2D) -> void:
	var obj = area.get_parent()
	if obj && obj.type == filter_type:
		emit_signal("on_interaction", obj);
