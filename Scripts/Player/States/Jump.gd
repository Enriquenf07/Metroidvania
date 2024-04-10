extends IJump

func process_input(event: InputEvent):
	if input_component.wants_dash():
		return parent.get_state('dash')
	if input_component.wants_attack():
		return parent.get_state('attack')
	if input_component.wants_stop_jump():
		return parent.get_state('fall')
	return null
