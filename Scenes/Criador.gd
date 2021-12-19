extends Node2D

var id = 0

func _ready():
	$Sprite.frames = load("res://Assets/Sprites/"+Manager.list_files_in_directory("res://Assets/Sprites/")[0])
	$CanvasLayer/Left/left_arrow.set("modulate","252525")
	
func _on_Left_pressed():
	if id > 0:
		$CanvasLayer/Right/right_arrow.set("modulate","cccccc")
		id = id - 1
		$Sprite.frames = load("res://Assets/Sprites/"+Manager.list_files_in_directory("res://Assets/Sprites/")[id])
		if id - 1 < 0:
			$CanvasLayer/Left/left_arrow.set("modulate","252525")

func _on_Right_pressed():
	if id < len(Manager.list_files_in_directory("res://Assets/Sprites/"))-1:
		$CanvasLayer/Left/left_arrow.set("modulate","cccccc")
		id = id + 1
		$Sprite.frames = load("res://Assets/Sprites/"+Manager.list_files_in_directory("res://Assets/Sprites/")[id])
		if id + 1 > len(Manager.list_files_in_directory("res://Assets/Sprites/"))-1:
			$CanvasLayer/Right/right_arrow.set("modulate","252525")
		
func _on_Criar_pressed():
	if len(Manager.list_files_in_directory("res://Monsters/"))>0:
		Manager.update_self(Manager.last_id + 1)
		Manager.update_data(0,0,0,"res://Assets/Sprites/"+Manager.list_files_in_directory("res://Assets/Sprites/")[id],Manager.last_id)
		get_tree().change_scene("res://Scenes/Lobby.tscn")
		Manager.last_id = Manager.last_id + 1
	else:
		Manager.update_data(0,0,0,"res://Assets/Sprites/"+Manager.list_files_in_directory("res://Assets/Sprites/")[id],0)
		get_tree().change_scene("res://Scenes/Lobby.tscn")

