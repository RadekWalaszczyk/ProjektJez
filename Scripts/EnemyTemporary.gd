extends Node3D
class_name EnemyTemporary

@export var HealthPoints : int = 4

var player : CharacterBody3D

func _ready():
	player = get_node("../Player/PlayerController")
	pass

func _physics_process(delta : float):
	if player != null:
		look_at(player.global_position)
		global_position += transform.basis * Vector3.FORWARD * 0.1
	pass

func GetDamage(damage : int) -> void:
	HealthPoints -= damage
	if HealthPoints <= 0:
		queue_free()
