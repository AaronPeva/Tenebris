extends "res://Scripts/card.gd"

var Curar = 5
var Daño = 3

func accion_consumible():
	super.accion_consumible()
	Global.hp_carta_jugador += Curar
	vidaBoss.value -= Daño
