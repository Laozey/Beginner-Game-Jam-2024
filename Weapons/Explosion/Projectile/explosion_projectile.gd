class_name ExplosionProjectile
extends Projectile

@onready var hit_box: OneTimeHitBox = $HitBox


func _ready() -> void:
	hit_box.hit_all_enemies()


func init(_level: int, direction: Vector2) -> void:
	super.init(_level, direction)
	hit_box.init(projectile_data.damage)


func _on_hit_box_hit() -> void:
	queue_free()
