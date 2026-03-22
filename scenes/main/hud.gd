extends Control

func update_hitpoints(new_value: int) -> void:
	$Health/HealthBar.value = new_value
