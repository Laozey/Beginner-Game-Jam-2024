class_name Exp
extends Node

signal level_up
signal exp_changed(new_exp, prev_exp)

@export var base_threshold: float

var curr_exp: float = 0
var threshold: float = 0


func _ready() -> void:
	threshold = base_threshold


func take_exp(amount: float) -> void:
	var prev_exp = curr_exp
	curr_exp += amount
	exp_changed.emit(curr_exp, prev_exp)
	if curr_exp >= threshold:
		next_level()


func next_level() -> void:
	# Put math here
	print("Hey!")
	level_up.emit()
