extends "res://Scripts/card.gd"

var Autodaño = 5
var Recuperacion_energia = 2


func accion_consumible():
	super.accion_consumible()
	Global.hp_carta_jugador -= Autodaño
	var energia_actual = energia_general.text.to_int()
	energia_actual += Recuperacion_energia
	energia_general.text = str(energia_actual)
