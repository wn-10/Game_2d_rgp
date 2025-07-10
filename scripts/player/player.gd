class_name Player
extends CharacterBody2D

@export var move_speed : float = 100.0
var player_direction : Vector2 = Vector2.ZERO
var animation_player_direction : Vector2 = Vector2.DOWN
var state : String = "idle"
@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	player_direction = Input.get_vector("left","right","up","down")
	velocity = player_direction * move_speed
	if set_state() or set_direction():
		update_animation()

func _physics_process(_delta: float) -> void:
	move_and_slide()

func set_direction() -> bool:
	var new_direction : Vector2 = animation_player_direction
	if player_direction == Vector2.ZERO:
		return false
	if player_direction.y == 0:
		new_direction = Vector2.LEFT if player_direction.x < 0 else Vector2.RIGHT
	if player_direction.x == 0:
		new_direction = Vector2.UP if player_direction.y < 0 else Vector2.DOWN
	if  new_direction == animation_player_direction:
		return false
	animation_player_direction = new_direction
	# 翻转,此方法可以让子节点一起翻转
	player_sprite.scale.x = -1 if animation_player_direction == Vector2.LEFT else 1
	return true

func set_state() -> bool:
	var new_state : String = "idle"
	if player_direction != Vector2.ZERO:
		new_state = "walk"
	if new_state == state:
		return false
	state = new_state
	return true

func update_animation() -> void:
	animation_player.play(state + "_" + animation_direction())

func animation_direction() -> String:
	if animation_player_direction == Vector2.DOWN:
		return "down"
	elif animation_player_direction == Vector2.UP:
		return "up"
	else :
		return "side"
