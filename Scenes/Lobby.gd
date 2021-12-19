extends Node2D

var monster_list =[]

func _ready():
	$Monsters._spawn_monsters_in_lobby()
	Manager.selected_monster=null
	monster_list = $Monsters.get_children()
	for monsters in monster_list:
		monsters.connect("monster_selected", self, "_on_MonsterSelected")
		monsters.get_node("HP_bar").hide()
	_on_MonsterSelected(Manager.selected_monster)
	
func _input(event):
	if event.is_action_pressed("ui_left"):
		$Camera2D.position.x -= 100
		
	if event.is_action_pressed("ui_right"):
		$Camera2D.position.x += 100
		
func _on_MonsterSelected(monster):
	if monster != null:
		$UI/Stats.show()
		$UI/Control.show()
		$UI/Stats/Hp_Value.text = str(monster.hp)
		$UI/Stats/Spd_Value.text = str(monster.speed)
		$UI/Stats/Str_Value.text = str(monster.strength)
		$UI/Stats/Bff_Value.text = str(monster.buffness)
		Manager.selected_monster = monster
		Manager.selected_monster_id = monster.monster_id

func _on_Fight_pressed():
	get_tree().change_scene("res://Scenes/Fight.tscn")

func _on_Mouse_remove_mark():
	Manager.selected_monster = null
	$UI/Stats.hide()
	$UI/Control.hide()

func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
