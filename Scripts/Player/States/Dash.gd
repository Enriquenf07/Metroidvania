extends IMove

var timer: Timer
var _is_time_over: bool
var direction: Vector2

func enter():
	_is_time_over = false
	parent.set_hitbox_disabled(true)
	timer = Timer.new()
	timer.wait_time = 0.5
	timer.one_shot = true
	add_child(timer)
	timer.timeout.connect(_on_Timer_timeout)
	timer.start()
	

func exit():
	timer.queue_free()
	parent.set_hitbox_disabled(false)
	
func process_physics(delta):
	parent.velocity.y = 0
	movement =  (1 if animations.flip_h == false else -1) * move_speed
	parent.velocity.x = movement
	parent.move_and_slide()
	
	
func process_frame(delta):
	if _is_time_over:
		return parent.get_state('move')

func _on_Timer_timeout():
	print('oi')
	_is_time_over = true
