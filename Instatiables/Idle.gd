extends State

var target_direction: Vector2 = Vector2.ZERO

func starting() -> void:
	_change_target_direction()
	monster.get_node("TileMap").animation="walking"

func execute(_delta: float) -> void:
	monster.direction = target_direction

func leaving() -> void:
	target_direction = Vector2.ZERO
	$Timer.stop()

func _change_target_direction():
	randomize()
	target_direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
	if monster.facing.x != 0:
		monster.scale.x = monster.facing.x
	$Timer.start()


func _on_Timer_timeout():
	_change_target_direction()
