extends State
class_name IIdle


func process_physics(delta):
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	return null
