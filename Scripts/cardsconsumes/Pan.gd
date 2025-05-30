extends "res://Scripts/card/card.gd"

var Curar1 = 5
var Curar2 = 10
var Curar3 = 15

func actualizar_texto():
	descripcion_texto = "Restaura una cantidad aleatoria de vida entre 5 y 15 puntos."


func accion_consumible():
	super.accion_consumible()
	randomize()

	var resultado = randi() % 3 

	match resultado:
		0:
			Global.hp_carta_jugador += Curar1
		1:
			Global.hp_carta_jugador += Curar2
		2:
			Global.hp_carta_jugador += Curar3
