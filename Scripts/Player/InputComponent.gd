extends Input_component

@onready var dashCooldown: Timer = %DashCooldown
var can_dash := true

func get_movement_direction() -> float:
	return Input.get_axis('move_left', 'move_right')

func get_movement_direction_complex():
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if direction.y != 0:
		return 0
	return Input.get_axis('move_left', 'move_right')

func wants_jump() -> bool:
	return Input.is_action_just_pressed('jump')

func wants_attack():
	return Input.is_action_just_pressed('attack')

func wants_dash():
	if can_dash and Input.is_action_just_pressed('dash'):
		dashCooldown.start()
		can_dash = false
		return true
	return false

func wants_stop_jump():
	return Input.is_action_just_released('jump')

func _on_dash_cooldown_timeout():
	can_dash = true
