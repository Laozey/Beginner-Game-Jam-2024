class_name Projectile
extends Node2D


func init(direction: Vector2) -> void:
	var angle = transform.x.angle_to(direction)
	rotate(angle)
