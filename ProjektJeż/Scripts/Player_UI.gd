extends Control
class_name PlayerUI

@onready var LastSpells = $Panel/Label

func SetLastSpells(lastSpells : Array[SpellCombo.Spells]):
	var string : String
	for spell in lastSpells:
		if SpellCombo.Spells.keys()[spell] != "None":
			string += " " + SpellCombo.Spells.keys()[spell]
	LastSpells.text = string
	pass
