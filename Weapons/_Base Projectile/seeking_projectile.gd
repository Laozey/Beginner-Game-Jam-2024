class_name SeekingProjectile
extends StraightProjectile

@export var do_seek: bool
@export_range(-360, 360) var angular_speed: float:
	get:
		return deg_to_rad(angular_speed)

var target: Node2D


func _process(delta: float) -> void:
	super._process(delta)
	if do_seek:
		var rot = angular_speed
		if target:
			var direction = global_position.direction_to(target.global_position)
			var angle = transform.x.angle_to(direction)
			rot = min(angular_speed, angle)
		rotate(rot)
