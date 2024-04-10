extends State
class_name IBasicMovement

signal change_direction
var movement

func base_acceleration(delta):
	movement = input_component.get_movement_direction() * move_speed
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var target_velocity = input_direction.normalized() * move_speed
	if input_direction.length() > 0:
		parent.velocity.x = parent.velocity.move_toward(target_velocity, acceleration * delta).x
	else:
		parent.velocity.x = parent.velocity.move_toward(Vector2.ZERO, deceleration * delta).x  
	emit_signal('change_direction', movement)

func basic_movement(delta):
	return input_component.get_movement_direction() * move_speed
