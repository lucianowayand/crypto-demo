extends Node2D

var hovering = false
signal remove_mark

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _process(delta):
	global_position = self.get_global_mouse_position()
	

func _on_Area2D_body_entered(body):
	if body.get_parent().name == "Monsters":
		$Cursor.frame = 12
		hovering = true

func _on_Area2D_body_exited(body):
	$Cursor.frame = 0
	hovering = false
	

func _input(event):
	if event is InputEventMouseButton and event.doubleclick:
		emit_signal("remove_mark")
