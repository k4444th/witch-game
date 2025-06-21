extends Node

func _on_button_pressed() -> void:
	Gamemanager.nextScene = "res://scenes/map.tscn"
	get_tree().change_scene_to_packed(load("res://scenes/loadingscreen.tscn"))
