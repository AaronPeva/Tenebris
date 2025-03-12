extends Node2D

const CARD_SCENE_PATH = "res://Scenes/card1.tscn"
const card_draw_speed = 0.3

var player_deck = ["Knight", "gitano", "Mascara", "rata", "feo"]  # Cartas disponibles
var card_database_reference

func _ready() -> void:
	card_database_reference = load("res://Scripts/CardDatabase.gd").new()

func draw_card():
	if player_deck.is_empty():
		return  # Evita que el juego falle si no hay cartas en el mazo (aunque ahora no debería ocurrir)

	# Seleccionar una carta aleatoria SIN eliminarla
	var random_index = randi() % player_deck.size()
	var card_draw = player_deck[random_index]  # Ahora la carta no se elimina

	var card_scene = load(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()

	# Asegurar que la carta tiene los nodos esperados antes de asignar valores
	if new_card.has_node("Attack") and new_card.has_node("Energy"):
		new_card.get_node("Attack").text = str(card_database_reference.CARDS[card_draw][0])
		new_card.get_node("Energy").text = str(card_database_reference.CARDS[card_draw][1])

	$"../CardManager".add_child(new_card)
	new_card.name = "Card"

	$"../PlayerHand".add_card_to_hand(new_card, card_draw_speed)
