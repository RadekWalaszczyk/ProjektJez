extends Node3D

func _ready():
	pass # Replace with function body.

func _process(delta):
	global_position += transform.basis * Vector3.FORWARD * 2
	pass
