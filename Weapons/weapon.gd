class_name Weapon
extends Area2D

@export var weapon_data: WeaponData

var targets: Array[Node2D]


func fire() -> void:
	var projectiles: Array[Projectile] = []
	var pool: Node = get_tree().get_first_node_in_group("ProjectilePool")
	for _i in range(weapon_data.projectile_count):
		var p = weapon_data.projectile.instantiate() as Projectile
w		pool.add_child(p)
		p.global_position = global_position
		projectiles.append(p)
	spread_projectiles(projectiles)


#func spread_projectiles(projectiles: Array[Projectile]) -> void:
	#var fire_direction: Vector2 = get_fire_direction()
	#var total_spread = weapon_data.spread
	#var positive_spread: float = total_spread / 2.0
	#var per_projectile_spread: float = total_spread / float(projectiles.size() + 1)
	#match weapon_data.spread_strategy:
		#weapon_data.SpreadStrategy.PER_PROJECTILE:
			#per_projectile_spread = total_spread
			#positive_spread = projectiles.size() - 1 * per_projectile_spread
	#var spread: float = positive_spread
	#for projectile in projectiles:
		#var angle: float = positive_spread - spread
		#var direction: Vector2 = fire_direction.rotated(angle)
		#projectile.init(direction)
		#if weapon_data.spread_strategy == weapon_data.SpreadStrategy.RANDOM:
			#var delta: float = per_projectile_spread / 2.5
			#var min_spread = per_projectile_spread - delta
			#var max_spread = per_projectile_spread + delta
			#spread -= randf_range(min_spread, max_spread)
		#else:
			#spread -= per_projectile_spread


func spread_projectiles(projectiles: Array[Projectile]) -> void:
	match weapon_data.spread_strategy:
		WeaponData.SpreadStrategy.RANDOM:
			var spread = weapon_data.spread / 2.0
			for projectile in projectiles:
				var angle: float = deg_to_rad(randf_range(0, weapon_data.spread))
				var direction = Vector2.RIGHT.rotated(spread - angle)
				projectile.init(direction)
		WeaponData.SpreadStrategy.PER_PROJECTILE:
			var total_spread: float = \
				weapon_data.spread * (weapon_data.projectile_count - 1)
			var fire_direction = get_fire_direction()
			var spread = total_spread / 2.0
			for projectile in projectiles:
				var direction = fire_direction.rotated(spread)
				projectile.init(direction)
				spread -= weapon_data.spread


func get_fire_direction() -> Vector2:
	var fire_direction = transform.x
	if targets.is_empty():
		match weapon_data.target_priority:
			WeaponData.TargetStrategy.NONE:
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
		var dist = global_position.distance_squared_to(targets[i].global_position)
		if dist < min_dist:
			min_dist = dist
			target = targets[i]
	return target


func _on_area_entered(area: Area2D) -> void:
	targets.append(area)


func _on_area_exited(area: Area2D) -> void:
	targets.erase(area)
