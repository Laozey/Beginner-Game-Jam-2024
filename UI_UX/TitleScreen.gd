extends Control

func _ready():
	MusicPlayer.play_music_title()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Levels/test_level.tscn") #Put the Game Scene Here

func _on_quit_button_pressed():
	get_tree().quit()

func _on_credit_button_pressed():
	get_tree().change_scene_to_file("res://UI_UX/credits.tscn")
