class_name WeaponManager
extends Node2D


func add_weapon(new_weapon: PackedScene) -> void:
	var weapon = new_weapon.instantiate() as Weapon
	add_child(weapon)
