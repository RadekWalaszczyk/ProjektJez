extends Node3D
class_name SpellMoving

@export var spellSpeed : float = 1
@export var spellFindRadius : float = 1
@export var spellArea : Area3D

var target : Node3D

func _process(delta):
	if target == null:
		spellArea.scale *= spellFindRadius
		var areas = spellArea.get_overlapping_areas()
		var shortestDist = INF
		for area in areas:
			var currDist = global_position - area.global_position
			if currDist < shortestDist:
				currDist = shortestDist
				target = area
	else:
		look_at(target.global_position)
		translate(transform.basis.z * spellSpeed)
	pass
