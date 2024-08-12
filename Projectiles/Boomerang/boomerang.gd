class_name Boomerang
extends SeekingProjectile


func _on_hit_box_last_hit() -> void:
	do_seek = true


func _on_trigger_box_body_entered(body: Node2D) -> void:
	queue_free()


func _on_seeking_box_body_entered(body: Node2D) -> void:
	target = body
