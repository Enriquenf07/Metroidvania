extends IBasicMovement
class_name IJump

@export
var max_jump: float = 800.0
@export var jump_force: float = 100

func enter() -> void:
	super()
		

func process_physics(delta: float) -> State:
	print(parent.velocity.y)
	if parent.velocity.y <= -max_jump:
		return parent.get_state('fall')
	parent.velocity.y += -jump_force
	if parent.velocity.y > 0:
		return parent.get_state('fall')
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
