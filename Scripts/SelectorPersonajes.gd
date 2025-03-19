extends Node2D

# Referencias a los nodos de la interfaz
@onready var texture_rect = $Panel/TextureRect
@onready var stats_label = $Panel/Label
@onready var prev_button = $Panel/Atras
@onready var next_button = $Panel/Siguiente
@onready var select_button = $Panel/Seleccionar  # Botón para seleccionar carta

# Lista de personajes
var personajes = []
var indice_actual = 0  # Cambiado a 0 para empezar desde el primero

func _ready():
	# Cargar personajes en la lista
	personajes.append(Personaje.new(preload("res://Imagenes/Cartas/Carta activa rana.png"), 2, 2, 5))
	personajes.append(Personaje.new(preload("res://Imagenes/Cartas/Carta activa linux.png"), 1, 1, 5))
	personajes.append(Personaje.new(preload("res://Imagenes/Cartas/Carta activa gimpmamado.png"), 3, 4, 5))

	# Actualiza la interfaz con el primer personaje
	actualizar_selector()

	# Conecta los botones a sus funciones
	prev_button.pressed.connect(_on_prev_button_pressed)
	next_button.pressed.connect(_on_next_button_pressed)
	select_button.pressed.connect(_on_select_button_pressed)  # Conectar botón de selección

# Actualiza la imagen y estadísticas del personaje actual
func actualizar_selector():
	var personaje = personajes[indice_actual]
	texture_rect.texture = personaje.imagen
	stats_label.text = "Ataque: %d\nEnergía: %d\nVida: %d" % [personaje.attack, personaje.energy, personaje.health]

# Función para cambiar al personaje anterior
func _on_prev_button_pressed():
	indice_actual = (indice_actual - 1 + personajes.size()) % personajes.size()
	actualizar_selector()

# Función para cambiar al siguiente personaje
func _on_next_button_pressed():
	indice_actual = (indice_actual + 1) % personajes.size()
	actualizar_selector()

# Función para seleccionar la carta actual
func _on_select_button_pressed():
	Global.carta_seleccionada = personajes[indice_actual]
	print("Carta seleccionada:", Global.carta_seleccionada)


func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MENU.tscn")

func _on_select_pressed() -> void:
	Global.carta_seleccionada = personajes[indice_actual]  # Guarda la carta en el script global
	get_tree().change_scene_to_file("res://Scenes/main.gd")  # Cambia a la escena del juego
