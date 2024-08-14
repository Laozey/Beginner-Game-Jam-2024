extends Area2D

@export var experience_gained = 10

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D

func _ready():
	return

func collect():
	sprite.visible = false
	collision.call_deferred("set","disabled", true)
	
