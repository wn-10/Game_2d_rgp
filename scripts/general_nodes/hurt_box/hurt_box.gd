class_name HurtBox
extends Area2D

@export var damage : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func body_entered(a : Area2D) -> void:
	if a is HitBox:
		a.take_damage(damage)
