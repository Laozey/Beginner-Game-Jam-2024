class_name Earthquake
extends Projectile

@onready var hit_box: OneTimeHitBox = $HitBox


func _ready() -> void:
	hit_box.hit_all_enemies()


func _on_hit_box_hit() -> void:
	queue_free()


func _on_trigger_box_body_entered(body: Node2D) -> void:
	self.reparent(body, false)
