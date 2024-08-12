class_name Spear
extends StraightProjectile


func free() -> void:
	queue_free()


func _on_hit_box_last_hit() -> void:
	free()


func _on_lifetime_timeout() -> void:
	free()
