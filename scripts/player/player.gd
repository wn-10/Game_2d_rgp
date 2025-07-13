class_name Player
extends CharacterBody2D

const DIR_4 = [Vector2.RIGHT,Vector2.DOWN,Vector2.LEFT,Vector2.UP]
var player_direction : Vector2 = Vector2.ZERO
var animation_player_direction : Vector2 = Vector2.DOWN
@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var state_machine: PlayerStateMachine = $StateMachine

signal direction_changed(new_direction : Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.initialize(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	player_direction = Input.get_vector("left","right","up","down")
	player_direction = player_direction.normalized()

func _physics_process(_delta: float) -> void:
	move_and_slide()

func set_direction() -> bool:
	if player_direction == Vector2.ZERO:
		return false
	
	var direction_id : int = int(round(player_direction + animation_player_direction * 0.1).angle() / TAU * DIR_4.size())
	var new_direction = DIR_4[direction_id]
	
	if new_direction == animation_player_direction:
		return false
	animation_player_direction = new_direction
	direction_changed.emit(new_direction)
	# 翻转,此方法可以让子节点一起翻转
	player_sprite.scale.x = -1 if animation_player_direction == Vector2.LEFT else 1
	return true


func update_animation(state : String) -> void:
	animation_player.play(state + "_" + animation_direction())

func animation_direction() -> String:
	if animation_player_direction == Vector2.DOWN:
		return "down"
	elif animation_player_direction == Vector2.UP:
		return "up"
	else :
		return "side"
