extends Control

var transiting := false;

func _input(event):
	if (event is InputEventKey or event is InputEventJoypadButton) and event.pressed:
		next();

func _on_Timer_timeout() -> void:
	next();

func next() -> void:
	$Timer.stop();
	if transiting:
		return 
	transiting = true;
	TransitionScreen.transitionToScene("res://src/ui/screens/GameLogo/GameLogo.tscn");
