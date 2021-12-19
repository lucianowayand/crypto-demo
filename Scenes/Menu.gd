extends Node2D

func _ready():
	if Manager.last_id == 0:
		$CanvasLayer/Start.set("disabled", true)

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Lobby.tscn")

func _on_Criar_pressed():
	get_tree().change_scene("res://Scenes/Criador.tscn")

func _on_Flush_pressed():
	Manager.update_self(0)
	Manager.last_id = 0
	var dir = Directory.new()
	for files in Manager.list_files_in_directory("res://Monsters/"):
		if files != "save.dat":
			dir.remove("res://Monsters/"+files)
	$CanvasLayer/Start.set("disabled", true)
