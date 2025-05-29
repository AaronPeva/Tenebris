extends "res://Scripts/card.gd"

func accion_consumible():
	super.accion_consumible()
	Global.max_clicks += 2
