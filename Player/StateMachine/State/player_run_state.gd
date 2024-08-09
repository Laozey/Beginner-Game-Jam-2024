class_name RunPlayerState
extends PlayerState

@export var run_sound: AudioStreamWAV

var direction: Vector2


func enter() -> void:
	player_node.play_animation("run")
	player_node.play_sound(run_sound)


func process(delta: float) -> void:
	player_node.move(delta)
