extends CanvasLayer



func _on_quit_pressed():
	get_tree().quit()


func _on_play_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
