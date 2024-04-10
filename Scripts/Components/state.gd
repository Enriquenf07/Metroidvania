extends Node
class_name State


@export
var animation_name: String
@export
var move_speed: float = 400
@export var acceleration: float = 1000
@export var deceleration: float = 4000

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var animations: AnimatedSprite2D
var input_component: Input_component
var parent: CharacterBody2D

func enter() -> void:
	animations.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
