extends Area2D

@export var damage: float

var direction

var initial_position: Vector2
@onready var hitbox := %Hitbox
var timer: Timer
var cooldown: Timer
var parent: CharacterBody2D

func _ready():
	initial_position = position
	hitbox.disabled = true

func _process(delta):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down", 0.5).normalized()
	if hitbox.disabled == false:
		return
	if direction.x < 0:
		position = initial_position + Vector2(-220, 0)
		return
	if direction.x > 0:
		position = initial_position
		return
	if direction.y > 0:
		position = initial_position + Vector2(-115, 115)
		return
	if direction.y < 0:
		position = initial_position + Vector2(-115, -40)
		return
	

func attack():
	if is_instance_valid(timer):
		return
	if is_instance_valid(cooldown):
		return
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(_finish_attack)
	timer.wait_time = 0.4
	timer.start()
	hitbox.disabled = false
	
func _finish_attack():
	hitbox.disabled = true
	timer.queue_free()
	cooldown = Timer.new()
	add_child(cooldown)
	cooldown.timeout.connect(_enable_attack)
	cooldown.wait_time = 0.7
	cooldown.start()
	
func _enable_attack():
	cooldown.queue_free()
	
func set_parent(parent: CharacterBody2D):
	self.parent = parent
