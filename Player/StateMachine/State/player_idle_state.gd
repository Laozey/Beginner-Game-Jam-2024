class_name IdlePlayerState
extends PlayerState

func enter() -> void:
	player_node.play_animation("idle")
