extends Node3D
class_name EnemyTemporary

@export var HealthPoints : int = 2

var player : CharacterBody3D

func _ready():
	player = get_node("../Player/PlayerController")
	pass

func _physics_process(delta : float):
	if player != null:
		look_at(player.global_position)
		global_position += transform.basis * Vector3.FORWARD * 0.1
	pass

func GetDamage() -> void:
	HealthPoints -= 1
	if HealthPoints <= 0:
		queue_free()
