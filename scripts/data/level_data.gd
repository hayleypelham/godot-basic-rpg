extends Node


const MAX_LEVEL: int = 5
const LEVEL_THRESHOLDS: Array[int] = [
	500,	# Level 1 -> 2
	900,	# Level 2 -> 3
	2500,	# Level 3 -> 4
	6300	# Level 4 -> 5
]


func _ready() -> void:
	var enemy_array: Array = get_tree().get_nodes_in_group("enemies")
	for i in enemy_array:
		i.died.connect(experience_gained)


func experience_gained(exp_gain: int) -> void:
	if PlayerData.level == LevelData.MAX_LEVEL:
		return
	
	var new_experience: int = PlayerData.experience + exp_gain
	if new_experience >= LevelData.LEVEL_THRESHOLDS[PlayerData.level - 1]:
		level_up(new_experience)
	else:
		PlayerData.experience = new_experience


func level_up(new_experience: int) -> void:
	print("level up")
	new_experience -= LevelData.LEVEL_THRESHOLDS[PlayerData.level - 1]
	PlayerData.level += 1
	PlayerData.experience = new_experience
