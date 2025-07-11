class_name StateWalk
extends State

@export var move_speed : float = 100.0
@onready var idle: State = $"../Idle"

func player_enter_state() -> void:
	player.update_animation("walk")


func player_exit_state() -> void:
	pass


func process_state(_delta : float) -> State:
	if player.player_direction == Vector2.ZERO:
		return idle
	player.velocity = player.player_direction * move_speed
	if player.set_direction():
		player.update_animation("walk")
	return null


func physics_process_state(_delta : float) -> State:
	return null
	
	
func handle_input_state(_event : InputEvent) -> State:
	return null
