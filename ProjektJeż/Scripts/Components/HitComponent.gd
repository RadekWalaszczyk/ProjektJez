extends Area3D
class_name HitComponent

@export var damage : int

func _on_area_entered(area : Area3D):
	var health = area as HealthComponent
	if health != null:
		health.GetDamage(damage)
	pass
