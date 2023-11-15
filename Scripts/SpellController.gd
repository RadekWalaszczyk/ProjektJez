extends Node

@export var Beat : BeatManager
@export_range(0.1, 0.5) var BeatMargin : float
@export var BasicSpells : Array[PackedScene]

# U - górny spell - 0
# R - prawy spell - 1
# D - dolny spell - 2
# L - lewy spell  - 3

var currCombo : Array[String]
var currentBeat = 0

func _ready():
	$DebugBeat.self_modulate = Color(0.2, 0.2, 0.2)

func _process(delta):
	SpellCaster()

func SpellCaster():
	var beat = Beat.time_to_closest_beat()
	if beat.y <= BeatMargin:
		$DebugBeat.self_modulate = Color(1, 1, 1)
	else:
		$DebugBeat.self_modulate = Color(0.2, 0.2, 0.2)
	
	var isInBeat = beat.y <= BeatMargin and currentBeat != beat.x

	if Input.is_action_just_pressed("SpellUp"):
		if isInBeat:
			CastSpell("U", beat.x, 0)
		else:
			currCombo.clear()
			
	if Input.is_action_just_pressed("SpellRight"):
		if isInBeat:
			CastSpell("R", beat.x, 1)
		else:
			currCombo.clear()

	if Input.is_action_just_pressed("SpellDown"):
		if isInBeat:
			CastSpell("D", beat.x, 2)
		else:
			currCombo.clear()
			
	if Input.is_action_just_pressed("SpellLeft"):
		if isInBeat:
			CastSpell("L", beat.x, 3)
		else:
			currCombo.clear()

func CastSpell(currInput : String, beat : int, spell : int):
	var newSpell = BasicSpells[spell].instantiate()
	get_tree().root.add_child(newSpell)
	newSpell.global_position = $"../PlayerController".global_position
	
	currentBeat = beat
	currCombo.push_front(currInput)
	currCombo.resize(4)

	currCombo.clear()
