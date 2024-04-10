extends IAttack

func enter():
	super()
	parent.on_attack()

func _physics_process(delta):
	parent.velocity.y += gravity * delta
	return null
