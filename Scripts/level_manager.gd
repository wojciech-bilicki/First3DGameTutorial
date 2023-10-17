extends Node

func unlock_level(level: int):
	var level_file = FileAccess.get_file_as_string("res://PersistedData/levels.json")
	var json_data = JSON.parse_string(level_file)
	
	if json_data is Dictionary:
		json_data["max_level"] = level
	
	var json_data_string = JSON.stringify(json_data)
	FileAccess.open("res://PersistedData/levels.json", FileAccess.WRITE).store_line(json_data_string)
	

func get_max_level():
	var level_file = FileAccess.get_file_as_string("res://PersistedData/levels.json")
	var json_data = JSON.parse_string(level_file)
	
	if json_data is Dictionary:
		return json_data["max_level"]
