extends CharacterBody2D

@onready var health := %Health

@onready var states ={
}

signal attack

func get_state(state_name):
	if states.has(state_name):
		return states.get(state_name)
	else:
		return null

func _on_health_die_signal():
	queue_free()
