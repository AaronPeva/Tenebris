extends "res://Scripts/card/card.gd"

var Autodaño = 10
var Daño = 10

func actualizar_texto():
	descripcion_texto = "Inflige 10 puntos de daño al enemigo y 10 puntos de daño a ti mismo."

func accion_consumible():
	super.accion_consumible()
	vidaBoss.value -= Daño
	Global.hp_carta_jugador -= Autodaño
