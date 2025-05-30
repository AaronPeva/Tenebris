extends Node

var main = preload("res://Scenes/main.tscn")
var escena_seleccionada = "res://Scenes/cardA1.tscn"
var puede_jugar = true

var hp_carta_jugador = 100
var attack_cost = 2
var attack_damage = 5
var niebla_activa = false
var carta1 = true
var carta2 = false
var carta3 = false
var max_clicks = 2
var clicks_actuales = 0
var viento_activo = false
var evento_activo = null
var fallo_base := 10
var critico_base := 10
var fallo_actual := fallo_base
var critico_actual := critico_base
var boss_fallo_base := 5
var boss_critico_base := 10
var boss_fallo_actual := boss_fallo_base
var boss_critico_actual := boss_critico_base

func _process(delta: float) -> void:
	if Global.hp_carta_jugador < 0:
		Global.hp_carta_jugador = 0
	if carta1:
		if Global.hp_carta_jugador > 100:
			Global.hp_carta_jugador = 100
	if carta2:
		if Global.hp_carta_jugador > 80:
			Global.hp_carta_jugador = 80
	if carta3:
		if Global.hp_carta_jugador > 120:
			Global.hp_carta_jugador = 120
