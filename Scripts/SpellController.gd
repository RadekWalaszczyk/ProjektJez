extends Node

@export_range(0.1, 0.5) var BeatMargin : float
@export var Beat : BeatManager

@export var Spell : PackedScene

var currentBeat = 0

func _ready():
	$DebugBeat.self_modulate = Color(0.2, 0.2, 0.2)

func _process(delta):
	SpellCaster()

func SpellCaster():
	var beat = Beat.time_to_closest_beat()
	if beat.y >= BeatMargin:
		$DebugBeat.self_modulate = Color(1, 1, 1)
	else:
		$DebugBeat.self_modulate = Color(0.2, 0.2, 0.2)
	
	var isInBeat = beat.y <= BeatMargin and currentBeat != beat.x
	
	if Input.is_action_just_pressed("SpellUp"):
		if isInBeat:
			currentBeat = beat.x
			var newSpell = Spell.instantiate()
			add_sibling(newSpell)
			newSpell.global_position = $"../PlayerController".global_position
			newSpell.global_rotation = $"../PlayerController".global_rotation
