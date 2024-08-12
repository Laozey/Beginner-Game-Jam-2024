class_name Player
extends CharacterBody2D

@export_category("Stats")
@export var speed: float

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func play_sound(stream: AudioStreamWAV) ->  void:
	audio_stream_player_2d.stream = stream
	audio_stream_player_2d.play()


func play_animation(anim: String) -> void:
	animated_sprite_2d.play(anim)


func move(delta: float) -> void:
	var direction = InputManager.get_direction()
	var motion: Vector2 = speed * delta * direction
	move_and_collide(motion)


func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().quit()
