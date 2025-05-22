extends "res://Scripts/card.gd"

var Curar = 1

func accion_consumible():
	super.accion_consumible()
	Global.hp_carta_jugador += Curar
