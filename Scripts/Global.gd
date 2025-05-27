extends Node

#var carta_seleccionada = null  # Almacena la carta seleccionada
var main = preload("res://Scenes/main.tscn")
var escena_seleccionada = "res://Scenes/cardA1.tscn"  # Guardará null o la ruta de la escena
var puede_jugar = true

var hp_carta_jugador = 80
var attack_cost = 1
var attack_damage = 10
var niebla_activa = false
var carta1 = true
var carta2 = false
var carta3 = false
var max_clicks = 10
var clicks_actuales = 0
var viento_activo = false
var evento_activo = null

func _process(delta: float) -> void:
	if Global.hp_carta_jugador < 0:
		Global.hp_carta_jugador = 0
	if carta1:
		if Global.hp_carta_jugador > 80:
			Global.hp_carta_jugador = 80
	if carta2:
		if Global.hp_carta_jugador > 100:
			Global.hp_carta_jugador = 100
	if carta3:
		if Global.hp_carta_jugador > 120:
			Global.hp_carta_jugador = 120
