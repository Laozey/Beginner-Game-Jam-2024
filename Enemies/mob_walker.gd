extends CharacterBody2D

@export var health = 30 
@export var speed = 100

@onready var player = get_node("/root/TestLevel/Player") #Will need to change the root they get

func _ready():
	return
	

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage(damage):
		health -= damage
		if health <= 0:
			queue_free()
