extends Node

export(String) var start_state: String

var current_state: String = ""

func starting() -> void:
	for states in get_children():
		states.monster = get_parent()
	change_state(start_state)


func executar(delta: float) -> void:
	get_node(current_state).execute(delta)


func change_state(new_state: String) -> void:
	if has_node(current_state):
		get_node(current_state).ao_sair()

	get_node(new_state).starting()
	current_state = new_state
