extends "res://Scripts/card/card.gd"

var Curar = 5
var Daño = 3

func actualizar_texto():
	descripcion_texto = "Inflige 3 puntos de daño y recuperas 5 puntos de vida."

func accion_consumible():
	super.accion_consumible()
	Global.hp_carta_jugador += Curar
	vidaBoss.value -= Daño
