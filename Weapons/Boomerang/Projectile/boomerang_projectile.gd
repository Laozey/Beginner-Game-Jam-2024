class_name BoomerangProjectile
extends SeekingProjectile

@onready var hit_box: HitBox = $HitBox


func init(_level: int, direction: Vector2) -> void:
	super.init(_level, direction)
	hit_box.init(projectile_data.damage, projectile_data.pierce)


func _on_hit_box_last_hit() -> void:
	do_seek = true


func _on_trigger_box_body_entered(body: Node2D) -> void:
	queue_free()


func _on_seeking_box_body_entered(body: Node2D) -> void:
	target = body
