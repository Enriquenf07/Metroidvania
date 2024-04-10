extends Node
class_name Health

@export
var max_value: float
var value: float

signal die_signal

func _ready():
	value = max_value

func increase_max_value(value):
	self.max_value += value
	
func handle_damage(value):
	self.value -= value
	
func _process(delta):
	if value <= 0:
		emit_signal('die_signal')
