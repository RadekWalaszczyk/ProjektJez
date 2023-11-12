extends Node3D

@export var ProjectileSpeed : float = 1
@export var ProjectileDamage : float = 1
@export var DestroyInTime : bool = false

var target : Node3D

func _physics_process(delta):
	if target == null:
		var allPossTargets = $NearestEnemy.get_overlapping_areas()
		var shortestDistance : float = 150
		for possTarget in allPossTargets:
			var currDist = (possTarget.global_position - global_position).length()
			if currDist < shortestDistance:
				shortestDistance = currDist
				target = possTarget
		return

	look_at(target.global_position)
	global_position += transform.basis * Vector3.FORWARD * ProjectileSpeed
	pass


func _on_hit_collider_area_entered(area: Area3D):
	var enemy = area.get_parent() as EnemyTemporary
	if enemy != null:
		enemy.GetDamage(ProjectileDamage)
	if !DestroyInTime:
		queue_free()
	pass


func _on_timer_timeout():
	queue_free()
	pass
