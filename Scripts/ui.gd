extends CanvasLayer

class_name UI

@onready var label = %Label
@onready var next_level_container = $NextLevelContainer


var time_passed = 0
var is_time_stopped = false

func _process(delta):
	if !is_time_stopped:
		time_passed += delta
		label.text = "%.2f" % time_passed

func on_level_finished():
	next_level_container.visible = true
	is_time_stopped = true
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
