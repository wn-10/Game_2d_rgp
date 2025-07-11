class_name StateIdle
extends State

@onready var walk: State = $"../Walk"

func player_enter_state() -> void:
	player.update_animation("idle")


func player_exit_state() -> void:
	pass


func process_state(_delta : float) -> State:
	if player.player_direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null


func physics_process_state(_delta : float) -> State:
	return null
	
	
func handle_input_state(_event : InputEvent) -> State:
	return null
