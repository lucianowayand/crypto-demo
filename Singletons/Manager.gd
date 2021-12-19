extends Node

var last_id = 0
var selected_monster = null
var selected_monster_id = 0

func _ready():
	if !list_files_in_directory("res://Monsters/").empty():
		last_id = load_self()["LI"]

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files

func update_data(speed, strength, buffness, sprite, monster_id):
	var monster_data = {
		"SPD":speed,
		"STR":strength,
		"BFF":buffness,
		"Sprite":sprite
		}
		
	var file : File = File.new()
	file.open("res://Monsters/"+str(monster_id)+".dat", File.WRITE)
	file.store_line(to_json(monster_data))
	file.close()
	
func load_monster(monster_id):
	var file : File = File.new()
	if file.file_exists("res://Monsters/"+str(monster_id)+".dat"):
		file.open("res://Monsters/"+str(monster_id)+".dat", File.READ)
		
		var monster_data = parse_json(file.get_as_text())
		
		file.close()
		
		return monster_data
		
func update_self(last_id):
	var save = {
		"LI": last_id
		}
		
	var file : File = File.new()
	file.open("res://Monsters/save.dat", File.WRITE)
	file.store_line(to_json(save))
	file.close()
	
func load_self():
	var file : File = File.new()
	if file.file_exists("res://Monsters/save.dat"):
		file.open("res://Monsters/save.dat", File.READ)
		
		var save_data = parse_json(file.get_as_text())
		
		file.close()
		
		return save_data
