extends "res://Scripts/card/card.gd"

var daño = 5
var curacion = 5
var energia_perdida = 1
func actualizar_texto():
	descripcion_texto = "Abre bajo tu propia responsabilidad."

func accion_consumible():
	super.accion_consumible()
	randomize()
	var resultado = randi() % 4

	match resultado:
		0:
			vidaBoss.value -= daño
		1:
			Global.hp_carta_jugador += curacion
		2:
			pass
		3:
			var energia_actual = energia_general.text.to_int()
			energia_actual -= energia_perdida
			energia_general.text = str(energia_actual)
