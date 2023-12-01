extends Node

@export var UI : PlayerUI
@export var Beat : BeatManager
@export_range(0.1, 0.5) var BeatMargin : float

var allCombosDict = {}

var currCombo : Array[SpellCombo.Spells]
var currentBeat = 0

var halfSpellCasted : bool = false

func _ready():
	LoadAllCombos()

func _process(delta):
	SpellCaster()

func SpellCaster():
	var beat = Beat.time_to_closest_beat()
	
	var isInBeat = beat.y <= BeatMargin and currentBeat != beat.x

	if Input.is_action_just_pressed("SpellUp"):
		if isInBeat:
			CastSpell(SpellCombo.Spells.UP, beat.x)
		else:
			ClearCombo()
	elif Input.is_action_just_pressed("SpellRight"):
		if isInBeat:
			CastSpell(SpellCombo.Spells.RIGHT, beat.x)
		else:
			ClearCombo()
	elif Input.is_action_just_pressed("SpellDown"):
		if isInBeat:
			CastSpell(SpellCombo.Spells.DOWN, beat.x)
		else:
			ClearCombo()
	elif Input.is_action_just_pressed("SpellLeft"):
		if isInBeat:
			CastSpell(SpellCombo.Spells.LEFT, beat.x)
		else:
			ClearCombo()

func ClearCombo():
	currCombo.clear()
	UI.SetLastSpells(currCombo)
	halfSpellCasted = false

func CastSpell(currInput : SpellCombo.Spells, beat : int):
	currentBeat = beat
	currCombo.push_front(currInput)
	if currCombo.size() > 4:
		currCombo.resize(4)
		ClearCombo()
		currCombo.push_front(currInput)
		
	# SPRAWDZA SPELLE
	var comboValue : SpellCombo
	# 4 - duże combo
	if currCombo.size() == 4:
		if allCombosDict.has(currCombo):
			comboValue = allCombosDict[currCombo]
			print("Rzuca spella: ", comboValue.ComboSequence)
			var newSpell = comboValue.ComboEffect.instantiate()
			get_tree().root.add_child(newSpell)
			newSpell.global_position = $"../PlayerController".global_position
			
#	# 3 - pojedyńczy
#	elif currCombo.size() == 3 and !halfSpellCasted:
#		var resizedCombo = currCombo.slice(0, 2)
#		if allCombosDict.has(resizedCombo):
#			comboValue = allCombosDict[resizedCombo]
#			print("Rzuca spella: ", comboValue.ComboSequence)
#			ClearCombo()
#	# 2 lub 4 - pojedyńczy
#	elif currCombo.size() > 1:
#		var resizedCombo = currCombo.slice(0, 2)
#		if allCombosDict.has(resizedCombo):
#			comboValue = allCombosDict[resizedCombo]
#			print("Rzuca spella: ", comboValue.ComboSequence)
#			halfSpellCasted = true
		
	UI.SetLastSpells(currCombo)


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
					allCombosDict[newFile.ComboSequence] = newFile
				#print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
