extends Node

#var carta_seleccionada = null  # Almacena la carta seleccionada
var main = preload("res://Scenes/main.tscn")
var escena_seleccionada = null  # Guardará null o la ruta de la escena
#func seleccionar_carta(ruta_carta: String):
	#carta_seleccionada = load(ruta_carta)  # Carga la escena de la carta
#func _ready():
	#if Global.carta_seleccionada != null:
		#main.instantiate()
		#add_child(carta_seleccionada)
		#carta_seleccionada.position = Vector2(200, 300)
