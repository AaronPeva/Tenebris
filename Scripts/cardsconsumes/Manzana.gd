extends "res://Scripts/card.gd"

var Curar = 5

func actualizar_texto():
	descripcion_texto = "MANZANA"

func accion_consumible():
	super.accion_consumible()
	Global.hp_carta_jugador += Curar
