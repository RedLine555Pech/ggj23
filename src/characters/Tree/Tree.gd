extends BaseCharacter

export(Array, NodePath) var path_eggs
export(float, 0.1, 1) var click_delay := 0.3

var eggs: Array = []
var clicked: int = 0
var can_click: bool = true

func _ready() -> void:
	for path in path_eggs:
		eggs.append(get_node(path))

func on_clicked():
	.on_clicked()
	if !can_click: return
	
	can_click = false
	
	AudioManager.play_sound("TreeShake")
	$AnimationPlayer.play("shake");
	
	if clicked < eggs.size() && eggs[clicked].has_method("fall"):
		eggs[clicked].fall()
	
	clicked += 1
	$DelayTimer.start(click_delay)


func _on_DelayTimer_timeout() -> void:
	can_click = true
