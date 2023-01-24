extends CanvasLayer

signal transitioned;

var scene_to_go = '';

func _ready() -> void:
	$AnimationPlayer.play("black_out");
	
func transition() -> void:
	$ColorRect.show();
	$AnimationPlayer.play("black_in");
	
func go_scene():
	disconnect("transitioned", self, "go_scene");
	get_tree().change_scene(scene_to_go);
	scene_to_go = '';
	
func transitionToScene(scene):
	transition();
	if scene:
		scene_to_go = scene;
		connect("transitioned", self, "go_scene");

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == 'black_out':
		$ColorRect.hide();
	elif anim_name == 'black_in':
		emit_signal("transitioned");
		$AnimationPlayer.play("black_out");
