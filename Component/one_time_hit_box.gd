class_name OneTimeHitBox
extends Area2D

signal hit

@export var damage: float


func hit_all_enemies() -> void:
	for area in get_overlapping_areas():
		if not area is HurtBox:
			continue
		var hurt_box = area as HurtBox
		hurt_box.take_damage(damage)
	hit.emit()
