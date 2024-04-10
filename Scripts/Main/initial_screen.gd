extends Control

@export
var NewGameScene: PackedScene

func _on_new_game_pressed():
	get_tree().change_scene_to_packed(NewGameScene)
