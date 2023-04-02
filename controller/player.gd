extends CharacterBody3D

@export var turn_speed: float = 2.0
@export var forward_speed: float = 4.0
@export var backward_speed: float = 2.0

var _turn_input_strength: float
var _move_input_strength: float

func _process(delta):
	_turn_input_strength = Input.get_axis("look_right", "look_left")
	_move_input_strength = Input.get_axis("move_forwards", "move_backwards")

func _physics_process(delta):
	rotate_y(_turn_input_strength * turn_speed * delta)
	if _move_input_strength < 0:
		velocity = global_transform.basis.z * _move_input_strength * forward_speed
	else:
		velocity = global_transform.basis.z * _move_input_strength * backward_speed
	move_and_slide()
