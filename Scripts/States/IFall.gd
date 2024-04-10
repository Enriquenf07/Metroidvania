extends IBasicMovement
class_name IFall

func enter():
	super()

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	movement = basic_movement(delta)
	if movement != 0:
		parent.velocity.x = movement
	parent.move_and_slide()
	emit_signal('change_direction', movement)
	if parent.is_on_floor():
		if movement != 0:
			return parent.get_state('move')
		return parent.get_state('idle')
	return null
