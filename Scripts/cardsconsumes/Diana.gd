extends "res://Scripts/card/card.gd"


func actualizar_texto():
	descripcion_texto = "Inflige 3 puntos de daño."
	
func accion_consumible():
	super.accion_consumible()
	Global.critico_actual = 100
