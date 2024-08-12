class_name HurtBox
extends Area2D

signal damage_taken(amount: float)


func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox == null:
		return
	
	var amount: float = hitbox.get_hit()
	take_damage(amount)


func take_damage(amount : float) -> void:
	damage_taken.emit(amount)
