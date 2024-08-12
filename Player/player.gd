class_name Player
extends CharacterBody2D

@export_category("Stats")
@export var speed: float
@export var health: float
@export var damage_rate: float

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

signal health_depleted

func play_sound(stream: AudioStreamWAV) ->  void:
	audio_stream_player_2d.stream = stream
	audio_stream_player_2d.play()


func play_animation(anim: String) -> void:
	animated_sprite_2d.play(anim)


func move(delta: float) -> void:
	var direction = InputManager.get_direction()
	var motion: Vector2 = speed * delta * direction
	move_and_collide(motion)

func _physics_process(delta):
	var damaging_mobs = %HurtBox.get_overlapping_bodies()
	print(damaging_mobs)
	if damaging_mobs.size() > 0:
		health -= damage_rate * damaging_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()

func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().quit()
