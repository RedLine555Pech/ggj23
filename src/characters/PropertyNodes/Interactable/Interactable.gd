extends Area2D

signal on_interaction(obj)

func _on_Interactable_area_entered(area: Area2D) -> void:
	var obj = area.get_parent()
	emit_signal("on_interaction", obj);
