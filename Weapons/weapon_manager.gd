class_name WeaponManager
extends Node2D

@export var projectile_pool: Node

func add_weapon(new_weapon: PackedScene) -> void:
	var weapon = new_weapon.instantiate() as Weapon
	weapon.projectile_fired.connect(projectile_pool.add_child)
	add_child(weapon)
