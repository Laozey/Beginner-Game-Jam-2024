class_name WeaponData
extends Resource

enum TargetStrategy {
	NONE,
	FACING,
	RANDOM,
	CLOSEST
}

enum SpreadStrategy {
	RANDOM,
	PER_PROJECTILE
}

@export var projectile: PackedScene
@export var rate_of_fire: float
@export var projectile_count: int:
	set(value):
		projectile_count = max(1, value)
@export var spread_strategy: SpreadStrategy
@export_range(0, 360) var spread: float:
	get:
		return deg_to_rad(spread)
@export var target_priority: TargetStrategy
