extends CharacterBody3D

@export var turn_speed: float = 2.0
@export var move_speed: float = 3.0

var _input_dir: Vector2

func _process(delta):
	var x_axis = Input.get_axis("look_right", "look_left")
	var y_axis = Input.get_axis("move_backwards", "move_forwards")
	_input_dir = Vector2(x_axis, y_axis).normalized() * -1

func _physics_process(delta):
	var speed = move_speed * _input_dir.length()
	if _input_dir != Vector2.ZERO:
		rotation.y = atan2(_input_dir.x, _input_dir.y)
	velocity = global_transform.basis.z * speed * -1
	move_and_slide()
