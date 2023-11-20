extends Node

@export var Beat : BeatManager
@export_range(0.1, 0.5) var BeatMargin : float

# U - górny spell - 0
# R - prawy spell - 1
# D - dolny spell - 2
# L - lewy spell  - 3

var allCombos : Array[SpellCombo]

var currCombo : Array[String]
var currentBeat = 0

func _ready():
	LoadAllCombos()
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
			CastSpell(SpellCombo.Spells.UP, beat.x)
		else:
			currCombo.clear()
			
	if Input.is_action_just_pressed("SpellRight"):
		if isInBeat:
			CastSpell(SpellCombo.Spells.RIGHT, beat.x)
		else:
			currCombo.clear()

	if Input.is_action_just_pressed("SpellDown"):
		if isInBeat:
			CastSpell(SpellCombo.Spells.DOWN, beat.x)
		else:
			currCombo.clear()
			
	if Input.is_action_just_pressed("SpellLeft"):
		if isInBeat:
			CastSpell(SpellCombo.Spells.LEFT, beat.x)
		else:
			currCombo.clear()

func CastSpell(currInput : SpellCombo.Spells, beat : int):
	#var newSpell = BasicSpells[spell].instantiate()
	#get_tree().root.add_child(newSpell)
	#newSpell.global_position = $"../PlayerController".global_position
	
	currentBeat = beat
	currCombo.push_front(currInput)
	currCombo.resize(4)

	currCombo.clear()

func LoadAllCombos():
	var path = "res://Database/ComboSequences/"
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				var newFile = load(path + file_name)
				if newFile is SpellCombo:
					allCombos.append(newFile)
				#print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
