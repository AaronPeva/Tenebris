extends "res://Scripts/card/card.gd"

var Daño = 3

func actualizar_texto():
	descripcion_texto = "Inflige 3 puntos de daño."
	
func accion_consumible():
	super.accion_consumible()
	vidaBoss.value -= Daño
