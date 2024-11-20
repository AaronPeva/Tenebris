extends Node2D

@onready var hand_layout = $GCardHandLayout
var mazo = []
var carta_scene = preload("res://Card.tscn")

func _ready():
	cargar_mazo()

func cargar_mazo():
	for i in range(5): # Ejemplo: Añadir 5 cartas al mazo
		var carta = carta_scene.instantiate()
		mazo.append(carta)


func robar_carta():
	if mazo.size() > 0:
		var carta_robada = mazo.pop_back()
		hand_layout.add_child(carta_robada)
		var num_cartas = hand_layout.get_child_count()
		carta_robada.position = Vector2(50 * (num_cartas - 1), 0) # Añade la carta al layout de la mano
	else:
		print("El mazo está vacío.")
	

func actualizar_mazo_visual():
	$GCardHandLayout.visible = mazo.size() > 5




	
