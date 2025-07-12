class_name StateAttack
extends State

@export var attack_sound : AudioStream
@export_range(15,20,0.5) var decelerate_speed : float
var attacking : bool = false
@onready var walk: State = $"../Walk"
@onready var idle: State = $"../Idle"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var animation_player_attack_effect: AnimationPlayer = $"../../PlayerSprite/AttackEffectSprite/AnimationPlayer"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"
@onready var hurt_box: HurtBox = $"../../Interactions/HurtBox"

func player_enter_state() -> void:
	player.update_animation("attack")
	animation_player_attack_effect.play("attack_" + player.animation_direction())
	animation_player.animation_finished.connect(end_attacking)
	
	audio_stream_player_2d.stream = attack_sound
	audio_stream_player_2d.pitch_scale = randf_range(0.9,1.1)
	audio_stream_player_2d.play()
	
	attacking = true
	
	await get_tree().create_timer(0.075).timeout
	hurt_box.monitoring = true
	


func player_exit_state() -> void:
	animation_player.animation_finished.disconnect(end_attacking)
	attacking = false
	hurt_box.monitoring = false
	pass


func process_state(_delta : float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	if attacking == false:
		if player.player_direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null


func physics_process_state(_delta : float) -> State:
	return null
	
	
func handle_input_state(_event : InputEvent) -> State:
	return null


func end_attacking(_new_animation_name : String) -> void:
	attacking = false
