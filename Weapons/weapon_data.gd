class_name WeaponData
extends Resource

enum Spread {
	ARC,
	RANDOM
}

enum TargetPriority {
	RANDOM,
	FACING,
	CLOSEST
}

@export var projectile: PackedScene
@export var projectile_count: int
@export var spread: Spread
@export var target_priority: TargetPriority
