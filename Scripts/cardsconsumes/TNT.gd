extends "res://Scripts/card.gd"

var Autodaño = 3
var Daño = 3
func accion_consumible():
	super.accion_consumible()
	vidaBoss.value -= Daño
	Global.hp_carta_jugador -= Autodaño
