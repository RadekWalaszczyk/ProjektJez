extends Control
class_name PlayerUI

@export var LastSpells : Label
@export var HealthBar : ProgressBar

func SetLastSpells(lastSpells : Array[SpellCombo.Spells]):
	var string : String
	for spell in lastSpells:
		if SpellCombo.Spells.keys()[spell] != "None":
			string = SpellCombo.Spells.keys()[spell] + "   " +  string
	LastSpells.text = string
	pass

func SetPlayerHealth(currentHealth : int):
	HealthBar.value = currentHealth * 100 / HealthBar.max_value
	pass


func _on_health_component_health_changed(old_value : int, new_value : int):
	SetPlayerHealth(new_value)
	pass
