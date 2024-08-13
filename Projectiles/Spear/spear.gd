class_name Spear
extends StraightProjectile


func _on_hit_box_last_hit() -> void:
	queue_free()


func _on_lifetime_timeout() -> void:
	queue_free()
