class_name Explosion
extends Projectile

@onready var hit_box: OneTimeHitBox = $HitBox


func _ready() -> void:
	hit_box.hit_all_enemies()


func _on_hit_box_hit() -> void:
	queue_free()
