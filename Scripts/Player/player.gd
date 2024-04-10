extends CharacterBody2D

@onready var machine_state :MachineState = %MachineState
@onready var health := %Health
var stats
var inventory
@onready var weapon := %Weapon
var skills
@onready var input_component := %InputComponent
@onready var animations := %Animations
@onready var hitbox := %Hitbox
@onready var states ={
	"idle": %Idle,
	"move": %Move,
	'attack': %Attack,
	"jump": %Jump,
	"fall": %Fall,
	'dash': %Dash,
}
var direction: int
signal attack

func get_state(state_name):
	if states.has(state_name):
		return states.get(state_name)
	else:
		return null

func _ready():
	weapon.set_parent(self)
	machine_state.init(self, animations, input_component)
	states.get('move').change_direction.connect(_on_change_direction)
	states.get('jump').change_direction.connect(_on_change_direction)
	states.get('fall').change_direction.connect(_on_change_direction)

func _physics_process(delta):
	machine_state.process_physics(delta)

func _unhandled_input(event):
	machine_state.process_input(event)
	
func _process(delta):
	machine_state.process_frame(delta)

func _on_health_die_signal():
	get_tree().reload_current_scene()
	
func on_attack():
	weapon.attack()
	if is_on_floor():
		machine_state.change_state(get_state('move'))
		return
	machine_state.change_state(get_state('fall'))

func _on_weapon_body_entered(body):
	if body.is_in_group('entity'):
		emit_signal('attack', weapon.damage, body)
		
func set_hitbox_disabled(flag: bool):
	self.hitbox.disabled = flag

func _on_change_direction(movement):
	if movement == 0:
		return
	animations.flip_h = movement < 0
