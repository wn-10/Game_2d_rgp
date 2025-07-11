class_name State
extends Node

static var player : Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func player_enter_state() -> void:
	pass


func player_exit_state() -> void:
	pass


func process_state(_delta : float) -> State:
	return null


func physics_process_state(_delta : float) -> State:
	return null
	
	
func handle_input_state(_event : InputEvent) -> State:
	return null
