extends "res://Scripts/card.gd"

var Autodaño = 5
var Curar = 10

func accion_consumible():
	super.accion_consumible()
	randomize() 
	var resultado = randi() % 2 # Esto da 0 o 1 al azar
	if resultado == 0:
		Global.hp_carta_jugador -= Autodaño
	else:
		Global.hp_carta_jugador += Curar
