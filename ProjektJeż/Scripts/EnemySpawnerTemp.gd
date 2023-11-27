extends Node3D

@export var Player : CharacterBody3D
@export var Enemy : PackedScene
@export var radius : float

func _on_timer_timeout():
	var randDir : Vector3
	randDir.x = randi_range(-1, 1)
	randDir.z = randi_range(-1, 1)
	randDir = randDir.normalized()
	var newEnemy = Enemy.instantiate()
	get_parent().add_sibling(newEnemy)
	newEnemy.global_position = randDir * radius
	pass 
