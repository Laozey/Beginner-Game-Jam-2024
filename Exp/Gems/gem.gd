extends Node2D

@export var gem_data: GemData

var xp: int

@onready var sprite = $Sprite2D
@onready var hit_box: HitBox = $HitBox


func _ready():
	sprite.texture = gem_data.texture
	hit_box.damage = gem_data.xp
	hit_box.hit_count = 1


func collect():
	queue_free()
