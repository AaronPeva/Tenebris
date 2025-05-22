extends "res://Scripts/card.gd"

func accion_consumible():
	super.accion_consumible()
	vidaBoss.value -= valor
