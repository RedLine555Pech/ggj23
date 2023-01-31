extends Node2D

var is_dragging = false;
var type = "CHICKEN"

func _on_Dragable_on_drag_started() -> void:
	$Sprite.modulate = Color(0,1,0);
	is_dragging = true;


func _on_Dragable_on_drag_finished() -> void:
	$Sprite.modulate = Color(1,1,1);
	is_dragging = false;



func _on_EggInteractable_on_interaction(obj) -> void:
	if !is_dragging:
		$Sprite.modulate = Color(0,0,0);
		
