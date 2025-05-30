extends "res://Scripts/card/card.gd"

var Curar = 200

func actualizar_texto():
	descripcion_texto = "Restaura toda tu vida al máximo."

func accion_consumible():
	super.accion_consumible()
	Global.hp_carta_jugador += Curar
