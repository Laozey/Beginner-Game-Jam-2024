class_name PlayerStateMachine
extends StateMachine

@export var player_node: Player

@onready var idle: IdlePlayerState = $Idle
@onready var run: RunPlayerState = $Run


func _ready() -> void:
	for child in get_children():
		if child is State:
			child.init(player_node)
	await player_node.ready
	super._ready()


func next_state() -> State:
	var state = idle
	if InputManager.get_direction() != Vector2.ZERO:
		state = run
	return state
