extends Node2D

var boss_damage = 5

func _ready() -> void:
	pass

func _on_atacar_pressed() -> void:
	await get_tree().create_timer(2.0).timeout
	Global.hp_carta_jugador -= boss_damage
	pass

func _on_saltar_pressed() -> void:
	await get_tree().create_timer(2.0).timeout
	Global.hp_carta_jugador -= boss_damage
