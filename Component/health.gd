class_name Health
extends Node

signal health_changed(new_health, prev_health)
signal health_depleted

@export var health: float


func take_damage(amount) -> void:
	var prev_health = health
	health -= amount
	if health <= 0:
		health_depleted.emit()
	else:
		health_changed.emit(health, prev_health)
