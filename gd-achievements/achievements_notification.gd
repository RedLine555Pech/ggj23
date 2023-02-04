extends Control

export(NodePath) onready var achievement_box = get_node(achievement_box) as AchievementItem

onready var animation_player = $AnimationPlayer

func set_achievement(achievement):
	achievement_box.set_data("Achievement Unlocked!", achievement["name"], load(achievement["icon_path"]))


func on_show():
	animation_player.play("popup")


func on_hide():
	animation_player.play("hide")
