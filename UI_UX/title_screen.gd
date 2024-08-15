extends Control

@export var level_scene_path: String
@export var credit_scene_path: String

func _ready():
	MusicPlayer.play_music_title()

func _on_start_button_pressed():
	get_tree().change_scene_to_file(level_scene_path) #Put the Game Scene Here

func _on_quit_button_pressed():
	get_tree().quit()

func _on_credit_button_pressed():
	get_tree().change_scene_to_file(credit_scene_path)
