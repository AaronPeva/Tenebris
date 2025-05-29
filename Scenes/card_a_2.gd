extends "res://Scripts/card_character.gd"

func _ready() -> void:
	super._ready()
	Global.hp_carta_jugador = 100
	Global.attack_damage = 10
	Global.attack_cost = 2
	Global.carta1 = false
	Global.carta2 = true
