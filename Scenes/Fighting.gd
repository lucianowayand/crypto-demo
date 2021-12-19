extends Node2D

onready var enemy = $Monster

func _ready():
	$Monsters._spawn_selected_monster(Manager.selected_monster_id,"Fight", Vector2(0,0))
	$Monsters._spawn_random_monster("Fight", Vector2(360,0))

func _on_Back_pressed():
	get_tree().change_scene("res://Scenes/Lobby.tscn")
