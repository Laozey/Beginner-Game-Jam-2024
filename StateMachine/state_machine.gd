class_name StateMachine
extends Node

@export var current_state: State


func _ready() -> void:
	if current_state:
		current_state.enter()


func _process(delta: float) -> void:
	var state = next_state()
	if state != current_state:
		change_state(state)
	current_state.process(delta)


func change_state(new_state: State) -> void:
	current_state.exit()
	current_state = new_state
	current_state.enter()


func next_state() -> State:
	return null
