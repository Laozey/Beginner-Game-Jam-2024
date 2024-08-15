class_name Weapon
extends Area2D

@export var weapon_data: WeaponData

var targets: Array[Node2D]
var level: int = 1

func fire() -> void:
	var projectiles: Array[Projectile] = []
	var pool: Node = get_tree().get_first_node_in_group("ProjectilePool")
	for _i in range(weapon_data.projectile_count):
		var p = weapon_data.projectile.instantiate() as Projectile
		pool.add_child(p)
		p.global_position = global_position
		projectiles.append(p)
	spread_projectiles(projectiles)


func spread_projectiles(projectiles: Array[Projectile]) -> void:
	match weapon_data.spread_strategy:
		WeaponData.SpreadStrategy.RANDOM:
			random_spread(projectiles)
		WeaponData.SpreadStrategy.PER_PROJECTILE:
			per_projectile_spread(projectiles)


func random_spread(projectiles: Array[Projectile]) -> void:
	var spread = weapon_data.spread / 2.0
	for projectile in projectiles:
		var angle: float = deg_to_rad(randf_range(0, weapon_data.spread))
		var direction = Vector2.RIGHT.rotated(spread - angle)
		projectile.init(level, direction)


func per_projectile_spread(projectiles: Array[Projectile]) -> void:
	var total_spread: float = \
		weapon_data.spread * (weapon_data.projectile_count - 1)
	var fire_direction = get_fire_direction()
	var spread = -total_spread / 2.0
	for projectile in projectiles:
		var direction = fire_direction.rotated(spread)
		projectile.init(level, direction)
		spread += weapon_data.spread


func get_fire_direction() -> Vector2:
	var fire_direction = transform.x
	if targets.is_empty():
		if weapon_data.target_priority == WeaponData.TargetStrategy.NONE:
			var t = randf_range(0, deg_to_rad(360))
			fire_direction = fire_direction.rotated(t)
	else:
		var target: Node2D  = null
		match weapon_data.target_priority:
			weapon_data.TargetStrategy.RANDOM:
				target = targets.pick_random()
			weapon_data.TargetStrategy.CLOSEST:
				target = get_closest_target()
		var target_position := target.global_position
		fire_direction = target_position.direction_to(global_position)
	return fire_direction


func get_closest_target() -> Node2D:
	if targets.is_empty():
		return null
	var target = targets[0]
	var min_dist = global_position.distance_squared_to(target.global_position)
	for i in range(1, targets.size()):
		var dist = global_position.distance_squared_to(
			targets[i].global_position)
		if dist < min_dist:
			min_dist = dist
			target = targets[i]
	return target


func _on_area_entered(area: Area2D) -> void:
	targets.append(area)


func _on_area_exited(area: Area2D) -> void:
	targets.erase(area)
