extends CharacterBody3D

@export var speed : float = 2
@export var accel : float = 10

@onready var nav = $NavigationAgent3D

func _physics_process(delta):
	var player : Node3D = GlobalGameController.Player
	
	var direction : Vector3
	
	nav.target_position = player.global_position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()
