class_name HitBox
extends Area2D

signal last_hit

@export var damage: float
@export var hit_count: int:
	set(value):
		hit_count = value
		if hit_count == 0:
			last_hit.emit()


func get_hit() -> float:
	hit_count -= 1
	return damage
