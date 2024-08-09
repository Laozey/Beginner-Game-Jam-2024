class_name State
extends Node


func _ready() -> void:
	if not has_method("init"):
		printerr("Require init method")


func enter() -> void:
	pass


func exit() -> void:
	pass


func process(_delta: float) -> void:
	pass
