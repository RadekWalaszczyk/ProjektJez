extends Area3D
class_name HealthComponent

@export var maxHealth : int
var health : int

signal health_changed(old_value, new_value)
signal death()

func _ready():
	health = maxHealth

func GetDamage(damage : int):
	health_changed.emit(health, health - damage)
	health -= damage
	print("dosatlem co za bul: ", health)
	if health <= 0:
		Death()

func Death():
	death.emit()
	pass
