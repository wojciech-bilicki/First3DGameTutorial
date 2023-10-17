extends Node3D

class_name FinishLine

signal level_won

func _on_area_3d_body_entered(body):
	level_won.emit()
