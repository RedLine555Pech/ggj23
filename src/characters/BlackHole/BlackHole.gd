extends BackBufferCopy


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Tween.interpolate_property(self, "scale", Vector2(0.5, 0.5), Vector2(5, 5), 10);
	$Tween.start();


func _on_Tween_tween_all_completed() -> void:
	TransitionScreen.transitionToScene("res://src/ui/UIEnd.tscn");

func _on_Area2D_area_entered(area: Area2D) -> void:
	var obj = area.get_parent() as BaseCharacter;
	if obj:
		obj.is_active = false;
