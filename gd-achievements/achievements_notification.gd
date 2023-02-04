extends Control


export(NodePath) onready var description = get_node(description) as Label
export(NodePath) onready var texture_rect = get_node(texture_rect) as TextureRect

onready var animation_player = $AnimationPlayer

func set_achievement(achievement):
	description.text = achievement["name"]
	texture_rect.texture = load(achievement["icon_path"])


func on_show():
	animation_player.play("popup")


func on_hide():
	animation_player.play("hide")
