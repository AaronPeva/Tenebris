extends Node2D

@onready var hand_layout = $GCardHandLayout
var mazo = []
var carta_scene = preload("res://Card.tscn")

func _ready():
	cargar_mazo()

# Cargar el mazo con cartas
func cargar_mazo():
	for i in range(5):  # Ejemplo: Añadir 5 cartas al mazo
		var carta = carta_scene.instantiate()
		mazo.append(carta)

# Función para robar una carta del mazo
func robar_carta():
	if mazo.size() > 0:
		var carta_robada = mazo.pop_back()
		hand_layout.add_child(carta_robada)  # Añade la carta a GCardHandLayout
		hand_layout._setup_cards()  # Asegúrate de actualizar la configuración de las cartas
	else:
		print("El mazo está vacío.")

# Función opcional para actualizar la visibilidad del mazo (si es necesario)
func actualizar_mazo_visual():
	$GCardHandLayout.visible = mazo.size() > 5
