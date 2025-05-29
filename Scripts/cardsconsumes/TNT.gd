extends "res://Scripts/card.gd"

var Autodaño = 10
var Daño = 10
func accion_consumible():
	super.accion_consumible()
	vidaBoss.value -= Daño
	Global.hp_carta_jugador -= Autodaño
