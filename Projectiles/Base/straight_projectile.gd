class_name StraightProjectile
extends Projectile

@export var speed: float

func _process(delta: float) -> void:
	translate(speed * delta * transform.x)
