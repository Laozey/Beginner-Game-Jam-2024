class_name SpearProjectile
extends StraightProjectile

@onready var hit_box: HitBox = $HitBox


func init(_level: int, direction: Vector2) -> void:
	super.init(_level, direction)
	hit_box.init(projectile_data.damage, projectile_data.pierce)


func _on_hit_box_last_hit() -> void:
	queue_free()


func _on_lifetime_timeout() -> void:
	queue_free()
