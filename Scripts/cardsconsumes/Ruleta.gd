extends "res://Scripts/card.gd"

func accion_consumible():
	super.accion_consumible()
	randomize() # Asegúrate de solo llamarlo una vez en _ready()

	var resultado = randi() % 2 # 0 o 1

	if resultado == 0:
		Global.hp_carta_jugador -= 200
		
		print("¡BOOM! Te metiste 200... estás en el suelo, literal. Vida al mínimo, crackeado.")
	else:
		vidaBoss.value -= 200
		print("¡CRÍTICO! 200 al boss. Está white, ruushhh yaaa!")
