class_name HitBox
extends Area2D

signal damageed(damage : int)

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func take_damage(damage : int) -> void:
	print("TakeDamage: ",damage)
	damageed.emit(damage)
