extends Node2D
var monster = preload("res://Instatiables/Monster.tscn")

func _spawn_monsters_in_lobby():
	if Manager.last_id != 0:
		for i in range(Manager.last_id):
			var monstro = monster.instance()
			monstro.monster_id = i
			monstro.name = str(i)
			monstro.position.x += i * 50
			monstro.spawned = true
			add_child(monstro)
	else:
		var monstro = monster.instance()
		monstro.monster_id = 0
		monstro.name = str(0)
		monstro.spawned = true
		add_child(monstro)
	
		
func _spawn_selected_monster(this_monster_id, state, position):
	var monstro = monster.instance()
	monstro.monster_id = this_monster_id
	monstro.name = str(this_monster_id)
	monstro.spawned = true
	monstro.get_node("StateManager").start_state = state
	monstro.position = position
	add_child(monstro)
	
func _spawn_random_monster(state, position):
	var monstro = monster.instance()
	monstro.monster_id = Manager.last_id + 1
	monstro.name = str(Manager.last_id + 1)
	monstro.spawned = false
	monstro.get_node("StateManager").start_state = state
	monstro.position = position
	
	randomize()
	monstro.speed = randi() % 10
	randomize()
	monstro.strength = randi() % 10
	randomize()
	monstro.buffness = randi() % 10
	randomize()
	var sprite_id = randi() % (len(Manager.list_files_in_directory("res://Assets/Sprites/"))-1)
	monstro.sprite = ("res://Assets/Sprites/"+Manager.list_files_in_directory("res://Assets/Sprites/")[sprite_id])
	add_child(monstro)
