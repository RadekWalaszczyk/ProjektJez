extends Resource
class_name SpellCombo

@export_group("Combo sequence")
@export var ComboSequence : Array[Spells]

@export_group("Combo effect")
@export var ComboEffect : PackedScene

enum Spells {None, UP, RIGHT, DOWN, LEFT}
