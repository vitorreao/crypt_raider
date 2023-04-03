extends Camera3D

@export var target: Node3D
@export var distance_from_target: Vector3 = Vector3(3.0, 8.6, -6.475)
@export var initial_rotation: Vector3 = Vector3(-47, 156, 0)

func _ready():
	rotation_degrees = initial_rotation

func _process(delta):
	global_position = distance_from_target + target.global_position
