class_name Projectile
extends Node2D

@export var projectile_data: ProjectileData
var level: int


func init(_level: int, direction: Vector2) -> void:
	level = _level
	var angle = transform.x.angle_to(direction)
	rotate(angle)
