extends Node

@export_range(0.1, 0.5) var BeatMargin : float

@export var Beat : BeatManager

func _ready():
	$DebugBeat.self_modulate = Color(0.2, 0.2, 0.2)
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var beat = Beat.time_to_closest_beat()
		if beat.y <= BeatMargin:
			print(beat)
			$DebugBeat.self_modulate = Color(1, 1, 1)
		else:
			$DebugBeat.self_modulate = Color(0.2, 0.2, 0.2)
	else:
		$DebugBeat.self_modulate = Color(0.2, 0.2, 0.2)
