extends CanvasLayer

@onready var button_container = %ButtonContainer


func _ready():
	var max_level = LevelManager.get_max_level()
	var buttons = button_container.get_children()

	for i in max_level:
		if i < buttons.size():
			(buttons[i] as Button).disabled = false
		


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
