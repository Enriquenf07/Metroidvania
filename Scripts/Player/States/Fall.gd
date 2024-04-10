extends IFall

func process_input(event: InputEvent):
	if input_component.wants_dash():
		return parent.get_state('dash')
	if input_component.wants_attack():
		return parent.get_state('attack')


