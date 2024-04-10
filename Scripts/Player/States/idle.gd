extends IIdle

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if input_component.get_movement_direction() != 0.0:
		return parent.get_state('move')
	if input_component.wants_attack():
		return parent.get_state('attack')
	if input_component.wants_jump():
		return parent.get_state('jump')
	if input_component.wants_dash():
		return parent.get_state('dash')
	return null

