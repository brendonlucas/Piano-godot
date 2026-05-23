extends Node


var current_music = "none"

func play_music():
	get_tree().current_scene.get_node_or_null(".").play_music()

func stop_music():
	get_tree().current_scene.get_node_or_null(".").stop_music()
