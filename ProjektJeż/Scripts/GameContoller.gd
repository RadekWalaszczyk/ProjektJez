extends Node3D
class_name GameController

@export var Player : Node3D

func _ready():
	GameGlobal.GameController_Inst = self
	Player = get_node("../Player/PlayerController")


func _process(delta):
	pass
