extends Node2D

# Referencias UI
@onready var texture_rect = $Panel/TextureRect
@onready var stats_label = $Panel/Label
@onready var prev_button = $Panel/Atras
@onready var next_button = $Panel/Siguiente
@onready var select_button = $Panel/Seleccionar



# Datos de personajes
var personajes = []
var indice_actual = 0

func _ready():
	# Inicialización de personajes
	personajes = [
		Personaje.new(
			preload("res://Imagenes/Cartas/Carta activa rana.png"),
			2, 2, 5,
			"res://Scenes/cardA1.tscn" # Solo la rana tiene escena
		),
		Personaje.new(
			preload("res://Imagenes/Cartas/Carta activa linux.png"),
			1, 1, 5, 
			"res://Scenes/cardA2.tscn" # Sin escena (será null)
		),
		Personaje.new(
			preload("res://Imagenes/Cartas/Carta activa gimpmamado.png"),
			3, 4, 5,
			"res://Scenes/cardA3.tscn"
			
		)
	]
	
	actualizar_selector()
	_conectar_botones()

func _conectar_botones():
	prev_button.pressed.connect(_on_prev_button_pressed)
	next_button.pressed.connect(_on_next_button_pressed)
	select_button.pressed.connect(_on_select_button_pressed)

func actualizar_selector():
	var personaje = personajes[indice_actual]
	texture_rect.texture = personaje.imagen
	stats_label.text = "Ataque: %d\nCoste: %d\nVida: %d" % [
		personaje.attack, 
		personaje.energy, 
		personaje.health
	]

func _on_prev_button_pressed():
	indice_actual = wrapi(indice_actual - 1, 0, personajes.size())
	actualizar_selector()

func _on_next_button_pressed():
	indice_actual = wrapi(indice_actual + 1, 0, personajes.size())
	actualizar_selector()

func _on_select_button_pressed():
	var escena_seleccionada = personajes[indice_actual].escena
	Global.escena_seleccionada = escena_seleccionada if escena_seleccionada else null
	print("Escena guardada:", Global.escena_seleccionada)
	print(Global.escena_seleccionada)

func _on_salir_pressed():
	get_tree().change_scene_to_file("res://Scenes/MENU.tscn")
	#Global.carta_seleccionada = personajes[indice_actual]  # Guarda la carta en el script global
	#get_tree().change_scene_to_file("res://Scenes/main.gd")  # Cambia a la escena del juego
