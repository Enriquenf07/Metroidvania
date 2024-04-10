extends IBasicMovement
class_name IMove


func process_physics(delta):
	parent.velocity.y += gravity * delta
	movement = basic_movement(delta)
	if movement == 0:
		return parent.get_state('idle')
	parent.velocity.x = movement
	emit_signal('change_direction', movement)
	parent.move_and_slide()
