extends "res://Scripts/card/card.gd"

var Recuperacion_energia = 1


func actualizar_texto():
	descripcion_texto = "Aumenta tu energía en +1."

func accion_consumible():
	super.accion_consumible()
	
	var energia_actual = energia_general.text.to_int()
	energia_actual += Recuperacion_energia
	energia_general.text = str(energia_actual)
