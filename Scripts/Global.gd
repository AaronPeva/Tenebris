extends Node

#var carta_seleccionada = null  # Almacena la carta seleccionada
var main = preload("res://Scenes/main.tscn")
var escena_seleccionada = "res://Scenes/cardA1.tscn"  # Guardará null o la ruta de la escena
var puede_jugar = true

var hp_carta_jugador = 80
var attack_cost = 1
var attack_damage = 10
var niebla_activa = false
