extends Node

@export_range(0.1, 0.5) var BeatMargin : float

@export var Beat : BeatManager

var currentBeat = 0

func _ready():
	$DebugBeat.self_modulate = Color(0.2, 0.2, 0.2)
	pass # Replace with function body.

func _process(delta):
	var beat = Beat.time_to_closest_beat()
	print(beat)
	if beat.y <= BeatMargin:
		currentBeat = beat.x
		$DebugBeat.self_modulate = Color(1, 1, 1)
	else:
		$DebugBeat.self_modulate = Color(0.2, 0.2, 0.2)
