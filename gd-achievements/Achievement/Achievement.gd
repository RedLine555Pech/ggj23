extends PanelContainer
class_name AchievementItem

export(NodePath) onready var title_box = get_node(title_box) as Label
export(NodePath) onready var description_box = get_node(description_box) as Label
export(NodePath) onready var texture_rect = get_node(texture_rect) as TextureRect
export(Color) var lock_modulate
export(Color) var unlock_modulate

var key: String = Achievements.NAME.INSTANT
var unlocked: bool = true

func _ready() -> void:
	AchievementManager.connect("achievement_unlocked", self, "achievement_unlocked")


func set_data(title: String, description: String, icon: StreamTexture):
	title_box.text = title
	description_box.text = description
	texture_rect.texture = icon


func set_key(new_key: String):
	key = new_key


func set_unlocked(value: bool):
	unlocked = value
	
	modulate = unlock_modulate if value else lock_modulate


func achievement_unlocked(achievement, achievement_key):
	if not achievement_key == key: return
	
	set_unlocked(true)
