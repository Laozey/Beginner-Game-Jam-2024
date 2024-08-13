class_name Fireball
extends StraightProjectile

@export var projectile: PackedScene


func explode() -> void:
	var p = projectile.instantiate() as Projectile
	# TODO Finish


func _on_trigger_box_area_entered(area: Area2D) -> void:
	explode()
	queue_free()


func _on_lifetime_timeout() -> void:
	queue_free()
