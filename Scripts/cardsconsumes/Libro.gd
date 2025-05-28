extends "res://Scripts/card.gd"

var Daño = 3

func accion_consumible():
	super.accion_consumible()
	vidaBoss.value -= Daño
