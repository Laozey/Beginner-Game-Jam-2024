class_name HitBox
extends Area2D

signal last_hit

var damage: float
var hit_count: int:
	set(value):
		hit_count = value
		if hit_count == 0:
			last_hit.emit()


func init(_damage: float, pierce: int) -> void:
	damage = _damage
	hit_count = 1 + pierce


func get_hit() -> float:
	hit_count -= 1
	return damage
