extends "res://Scripts/card/card.gd"

func actualizar_texto():
	descripcion_texto = "50% de ganar la partida instantáneamente, 50% de perderla al instante."
	
func accion_consumible():
	super.accion_consumible()
	randomize()

	var resultado = randi() % 2

	if resultado == 0:
		Global.hp_carta_jugador -= 200
	else:
		vidaBoss.value -= 200
