extends Node2D

#STAT_MODIFIER
export var speed = 0
export var strength = 0
export var buffness = 0

export var enabled = true

onready var monsters_in_training = []
var aux = []

func _ready():
	var monster_list = get_parent().get_node("Monsters").get_children()
	for monsters in monster_list:
		monsters.connect("stats_changed", self, "_on_StatsChanged")

func _on_Training_timeout():
	for monster in monsters_in_training:
		monster.raise_stats(speed,strength,buffness)

func monster_training():
	$Training.start()

func _on_StatsChanged():
	yield(get_tree().create_timer(0.8), "timeout")
	get_parent().get_node("UI/Stats/Hp_Value").text = str(Manager.selected_monster.hp)
	get_parent().get_node("UI/Stats/Spd_Value").text = str(Manager.selected_monster.speed)
	get_parent().get_node("UI/Stats/Str_Value").text = str(Manager.selected_monster.strength)
	get_parent().get_node("UI/Stats/Bff_Value").text = str(Manager.selected_monster.buffness)
