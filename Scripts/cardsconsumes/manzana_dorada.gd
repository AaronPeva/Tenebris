extends "res://Scripts/card.gd"

var Curar = 3

func accion_consumible():
	super.accion_consumible()
	Global.hp_carta_jugador += Curar
