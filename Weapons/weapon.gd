class_name Weapon
extends Area2D

@export var weapon_data: WeaponData

var targets: Array[Node2D]


func fire() -> void:
	var projectiles: Array[Projectile] = []
	for _i in range(weapon_data.projectile_count):
		var p = weapon_data.projectile.instantiate() as Projectile
		projectiles.append(p)
	place_projectiles(projectiles)
	# TODO Finish


func place_projectiles(projectiles: Array[Projectile]) -> void:
	# TODO Implement
	pass


func select_target() -> Node:
	var target = targets[0]
	match weapon_data.target_priority:
		weapon_data.TargetPriority.RANDOM:
			target = targets.pick_random()
		weapon_data.TargetPriority.CLOSEST:
			target = closest_target()
	return target


func closest_target() -> Node2D:
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
