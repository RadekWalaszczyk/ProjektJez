extends CharacterBody3D

@export var MaxSpeed : float = 400
@export var Acceleration : float = 1500
@export var Friction : float = 600

var input : Vector3 = Vector3.ZERO

func GetInput() -> Vector3:
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y))
	return direction.normalized()

func _physics_process(delta):
	PlayerMovement(delta)
	pass

func PlayerMovement(delta : float):
	input = GetInput()
	
	if input == Vector3.ZERO:
		if velocity.length() > (Friction * delta):
			velocity -= velocity.normalized() * (Friction * delta)
		else:
			velocity = Vector3.ZERO
	else:
		velocity += (input * Acceleration * delta)
		velocity = velocity.limit_length(MaxSpeed)
	move_and_slide()

