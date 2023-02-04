extends GridContainer

export(PackedScene) var achievement_box = preload("res://gd-achievements/Achievement/Achievement.tscn")

var achievements: Dictionary = {}

func _ready() -> void:
	achievements = AchievementManager.get_all_achievements() as Dictionary
	
	for child in get_children():
		remove_child(child)
		child.queue_free()
	
	for key in achievements:
		generate_achievement(achievements[key])

func generate_achievement(achievement: Dictionary):
	var item = achievement_box.instance() as AchievementItem
	item.set_key(achievement["key"])
	item.set_unlocked(achievement["achieved"])
	add_child(item)
	
	item.set_data(achievement["name"], achievement["description"], load(achievement["icon_path"]))
	
