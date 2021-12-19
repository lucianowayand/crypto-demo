extends KinematicBody2D

#SIGNALS
signal monster_selected(monster)
signal stats_changed

#CODEVARS
export var MOUSE_SPEED = 15
export var monster_id : int
var selected = false
var signal_emitted = false
var movement_speed = 15
var spawned = false
var direction : Vector2
var facing : Vector2

#DEFINING VARS
export var sprite : String
export var speed = 0
export var strength = 0
export var buffness = 0
var hp : int
var hp_max = 100

func _ready():
	if spawned:
		var monster_stats = Manager.load_monster(monster_id)
		speed = monster_stats["SPD"]
		strength = monster_stats["STR"]
		buffness = monster_stats["BFF"]
		sprite = monster_stats["Sprite"]
	
	$TileMap.frames = load(sprite)
	hp = 20 + (buffness * 5)
	$StateManager.starting()
	hp_max = 20 + (buffness * 5)

func _process(delta):
	if selected:
		global_position = lerp(global_position-Vector2(0,5), get_global_mouse_position(), MOUSE_SPEED * delta)
		if !signal_emitted:
			emit_signal("monster_selected", self)
			signal_emitted = true
		$TileMap.animation="default"
		
	else:
		$StateManager.executar(delta)
		update_facing_pos()
		move_and_slide(direction * movement_speed)
		
		

func _input(event):
	if event is InputEventMouseButton and not event.pressed:
		selected = false
		if signal_emitted:
			emit_signal("monster_selected", null)
			signal_emitted = !signal_emitted


func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true

func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if $StateManager.current_state == "Idle":
		if area.name != "Area2D":
			area.monsters_in_training.append(self)
			if area.enabled:
				area.monster_training()

func _on_Area2D_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if $StateManager.current_state == "Idle":
		if area.name != "Area2D":
			area.monsters_in_training.pop_front()

func raise_stats(sp,st,bf):
	$AnimationPlayer.play("raise_stats")
	speed += sp
	strength += st
	buffness += bf
	hp = 20 + (strength * 5)
	
	Manager.update_data(speed, strength, buffness, sprite, monster_id)
	emit_signal("stats_changed")
	
func update_facing_pos():
	if direction.x > 0:
		facing.x = 1
	elif direction.x < 0:
		facing.x = -1
	else:
		facing.x = 0	
	if direction.y > 0:
		facing.y = 1
	elif direction.y < 0:
		facing.y = -1
	else:
		facing.y = 0
	
