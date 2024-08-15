class_name HitBox
extends Area2D

signal last_hit

var damage: float
var hit_count: int:
	set(value):
		hit_count = value
		if hit_count == 0:
			last_hit.emit()


func init(_damage: float, _hit_count: int) -> void:
	damage = _damage
	hit_count = max(1, _hit_count)


func get_hit() -> float:
	hit_count -= 1
	return damage
