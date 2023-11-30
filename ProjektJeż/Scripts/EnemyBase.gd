extends CharacterBody3D

@export var speed : float = 2
@export var accel : float = 10

@onready var nav = $NavigationAgent3D

func _physics_process(delta):
	if GameGlobal.GameController_Inst == null or GameGlobal.GameController_Inst.Player == null:
		return
	
	var direction : Vector3
	
	nav.target_position = GameGlobal.GameController_Inst.Player.global_position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()
