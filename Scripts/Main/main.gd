extends Node2D

@onready var player: CharacterBody2D = %Player

func _on_player_attack(damage, body):
	if body == player:
		return
	body.health.handle_damage(damage)
