extends State

var enemy : KinematicBody2D
var knobckack : Vector2
var falling = false
var in_range = false

func starting() -> void:
	yield(get_tree().create_timer(0.05), "timeout")
	for monsters in monster.get_parent().get_children():
		if monsters != monster:
			enemy = monsters
			
	monster.get_node("TileMap").animation="walking"

func execute(_delta: float) -> void:
	if get_parent().current_state == "Fight" and enemy != null and !falling:
		monster.direction = monster.position.direction_to(enemy.position)
		monster.movement_speed = 80
		monster.get_node("HP_bar").show()
	
	if monster.hp < 0:
		enemy.get_node("StateManager/Fight").enemy = null
		monster.queue_free()

	if enemy == null:
		monster.direction = Vector2(0,0)
		monster.get_node("HP_bar").hide()
		monster.get_node("TileMap").animation="default"
	

func leaving() -> void:
	pass


func _on_Area2D_body_entered(body):
	in_range = true
	randomize()
	var hit_time = rand_range(1, monster.speed) * 0.1
	yield(get_tree().create_timer(hit_time), "timeout")
	if body == enemy and in_range:
		hit()
		
func hit():
	if enemy != null:
		falling = true
		monster.direction = enemy.facing
		monster.movement_speed = 400
		monster.move_and_slide(monster.direction * monster.movement_speed)
		yield(get_tree().create_timer(0.2), "timeout")
		monster.hp = monster.hp - (enemy.strength - (monster.buffness * 0.25))
		monster.get_node("HP_bar/Life").set("margin_right", 5+(38 * monster.hp/monster.hp_max))
		falling = false

func _on_Area2D_body_exited(body):
	in_range = false
