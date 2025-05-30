extends "res://Scripts/card/card.gd"


func actualizar_texto():
	descripcion_texto = "Te permite robar 2 cartas adicionales del mazo."

func accion_consumible():
	super.accion_consumible()
	Global.max_clicks += 2
