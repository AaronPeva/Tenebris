extends Node2D

const CARD_SCENE_PATH = "res://Scenes/card1.tscn"
const card_draw_speed = 0.3

var player_deck = []  # Cartas disponibles
var card_database_reference

#func _ready() -> void:
	#card_database_reference = load("res://Scripts/CardDatabase.gd").new()
	#for i in card_database_reference.CARDS:
		#var listCard = i
		#for j in listCard[2]:
			#player_deck.append(listCard)
	
func _ready() -> void:
	card_database_reference = load("res://Scripts/CardDatabase.gd").new()
	
	if not "CARDS" in card_database_reference:
		print("Error: CARDS no existe en CardDatabase.gd")
		return
	
	for card_name in card_database_reference.CARDS:
		var card_data = card_database_reference.CARDS[card_name]
		var card_energy = card_data[1]  # Segundo valor
		var card_quantity = int(card_data[2])  # Número de copias disponibles
		for _i in range(card_quantity):
			player_deck.append(card_name)  # Asegurarse de que solo se guarda el nombre, no una lista





func draw_card():
	if player_deck.is_empty():
		return  # Evita que el juego falle si no hay cartas en el mazo (aunque ahora no debería ocurrir)

	# Seleccionar una carta aleatoria SIN eliminarla
	var random_index = randi() % player_deck.size()
	var card_draw = player_deck[random_index]
	var card_name = card_draw[0]
	#player_deck.erase(card_draw)# Ahora la carta no se elimina
	player_deck.erase(card_draw)
	var card_scene = load(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()

	# Asegurar que la carta tiene los nodos esperados antes de asignar valores
	if new_card.has_node("Attack") and new_card.has_node("Energy"):
		new_card.get_node("Attack").text = str(card_database_reference.CARDS[card_draw][0])
		new_card.get_node("Energy").text = str(card_database_reference.CARDS[card_draw][1])

	$"../CardManager".add_child(new_card)
	new_card.name = "Card"

	$"../PlayerHand".add_card_to_hand(new_card, card_draw_speed)
