extends Node2D

# Referencias a los nodos de la interfaz
@onready var texture_rect = $Panel/TextureRect
@onready var stats_label = $Panel/Label
@onready var prev_button = $Panel/Atras
@onready var next_button = $Panel/Siguiente

# Lista de personajes
var personajes = []
var indice_actual = 1

func _ready():
	# Cargar personajes en la lista
	personajes.append(Personaje.new(preload("res://Imagenes/Carta activa rana.png"), 2, 2))
	personajes.append(Personaje.new(preload("res://Imagenes/Carta activa linux.png"), 1, 1))
	personajes.append(Personaje.new(preload("res://Imagenes/Carta activa gimpmamado.png"), 3, 4))

	# Actualiza la interfaz con el primer personaje
	actualizar_selector()

	# Conecta los botones a sus funciones
	prev_button.pressed.connect(_on_prev_button_pressed)
	next_button.pressed.connect(_on_next_button_pressed)

# Actualiza la imagen y estadísticas del personaje actual
func actualizar_selector():
	var personaje = personajes[indice_actual]
	texture_rect.texture = personaje.imagen
	stats_label.text = "Ataque: %d\nEnergia: %d" % [personaje.attack, personaje.energy]

# Función para cambiar al personaje anterior
func _on_prev_button_pressed():
	indice_actual = (indice_actual - 1 + personajes.size()) % personajes.size()
	actualizar_selector()

# Función para cambiar al siguiente personaje
func _on_next_button_pressed():
	indice_actual = (indice_actual + 1) % personajes.size()
	actualizar_selector()


func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MENU.tscn")
