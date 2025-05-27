extends "res://Scripts/card.gd"

var Curar1 = 1
var Curar2 = 2
var Curar3 = 3

func accion_consumible():
	super.accion_consumible()
	randomize()

	var resultado = randi() % 3 # Resultado será 0, 1 o 2

	match resultado:
		0:
			Global.hp_carta_jugador += Curar1
			print("Te curaste ", Curar1, " de vida. Como un mini escudo, pero humilde.")
		1:
			Global.hp_carta_jugador += Curar2
			print("Te curaste ", Curar2, " de vida. Nivel intermedio, estamos en zona segura.")
		2:
			Global.hp_carta_jugador += Curar3
			print("¡Bidón legendario activado! +", Curar3, " de vida, estás ready pa rushear.")
