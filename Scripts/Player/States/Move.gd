extends IMove

func process_input(event: InputEvent) -> State:
	if input_component.wants_attack():
		return parent.get_state('attack')
	if input_component.wants_jump():
		return parent.get_state('jump')
	if input_component.wants_dash():
		return parent.get_state('dash')
	return null

	
	
