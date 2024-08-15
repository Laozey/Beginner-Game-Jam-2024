class_name RunPlayerState
extends PlayerState

@export var run_sound: AudioStreamWAV


func enter() -> void:
	player_node.play_sound(run_sound)


func process(delta: float) -> void:
	player_node.move(delta)
	var direction: Vector2 = InputManager.get_direction()
	if direction == Vector2.UP:
		player_node.play_animation("run_backward")
	elif direction == Vector2.DOWN:
		player_node.play_animation("run_forward")
	else:
		var dot = Vector2.RIGHT.dot(direction)
		player_node.flip(dot <= 0)
		player_node.play_animation("run_side")
	
