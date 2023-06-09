extends CharacterBody3D

@export var player: CharacterBody3D
@export var maximum_distance_to_detect: float = 75.0
@export var field_of_view: float = 75

@onready var _ray_cast: RayCast3D = $RayCast3D

var _enemy_to_player: Vector3

func _ready():
	assert(player != null)

func _process(delta):
	_enemy_to_player = player.global_position - global_position
	_check_player_visibility()
	
func _check_player_visibility():
	if _enemy_to_player.length() < maximum_distance_to_detect:
		var angle = VectorUtils.angle_in_rads(_enemy_to_player.normalized() * -1, global_transform.basis.z)
		if angle < deg_to_rad(field_of_view):
			_ray_cast.target_position = to_local(player.global_position)

func _physics_process(delta):
	if _ray_cast.is_colliding() and _ray_cast.get_collider() == player:
		#print("TARGET LOCKED")
		pass
	else:
		#print("TARGET NOT LOCKED")
		pass
