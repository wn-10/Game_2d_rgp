class_name Player
extends CharacterBody2D

@export var move_speed : float = 100.0
var player_direction : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	player_direction = Input.get_vector("left","right","up","down")
	velocity = player_direction * move_speed

func _physics_process(_delta: float) -> void:
	move_and_slide()
