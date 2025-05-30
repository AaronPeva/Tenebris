extends "res://Scripts/card/card.gd"

var Curar = 5

func actualizar_texto():
	descripcion_texto = "Restaura 5 puntos de vida al instante."

func accion_consumible():
	super.accion_consumible()
	Global.hp_carta_jugador += Curar
