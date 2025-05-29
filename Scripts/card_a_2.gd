extends "res://Scripts/card_character.gd"

func _ready() -> void:
	super._ready()
	Global.hp_carta_jugador = 80
	Global.attack_damage = 5
	Global.attack_cost = 1
	Global.carta2 = true
	Global.carta1 = false
