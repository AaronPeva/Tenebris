extends "res://Scripts/card/card.gd"

var Curar = 10

func actualizar_texto():
	descripcion_texto = "Restaura 10 puntos de vida." 


func accion_consumible():
	super.accion_consumible()
	Global.hp_carta_jugador += Curar
