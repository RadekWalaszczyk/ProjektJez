extends Camera3D

@export var PlayerToFollow : CharacterBody3D
@export var ZOffset : float
@export var FollowTime : float

func _process(delta):
	if PlayerToFollow:
		var a = global_position 
		var b = PlayerToFollow.global_position + get_transform().basis.z * ZOffset
		var t = delta * FollowTime
		
		global_position = lerp(a, b, t)
	pass
