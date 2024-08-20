class_name FireballProjectile
extends StraightProjectile

@export var projectile_scene: PackedScene


func explode() -> void:
	var projectile = projectile_scene.instantiate() as Projectile


func _on_trigger_box_area_entered(_area: Area2D) -> void:
	explode()
	queue_free()


func _on_lifetime_timeout() -> void:
	queue_free()
