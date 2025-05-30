extends "res://Scripts/card/card.gd"

var Autodaño = 10
var Curar = 15

func actualizar_texto():
	descripcion_texto = "Puedes elegir entre curarte 10 puntos o sufrir 5 puntos de daño."

func accion_consumible():
	super.accion_consumible()
	randomize() 
	var resultado = randi() % 2
	if resultado == 0:
		Global.hp_carta_jugador -= Autodaño
	else:
		Global.hp_carta_jugador += Curar
