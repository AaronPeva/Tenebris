extends Node2D

const CARD_SCENE_PATH = "res://Scenes/Enemycard1.tscn"
const card_draw_speed = 0.4
var player_deck = []  
var card_database_reference
@onready var label = $Restantes

func _ready() -> void:
	card_database_reference = load("res://Scripts/card/CardDatabase.gd").new()
	
	if not "CARDS" in card_database_reference:
		return
	
	for card_name in card_database_reference.CARDS:
		var card_data = card_database_reference.CARDS[card_name]
		var card_energy = card_data[1]  
		var card_quantity = int(card_data[2])  
		for _i in range(card_quantity):
			player_deck.append(card_name)  

func draw_card():
	if Global.puede_jugar:
		if not $"../PlayerHand".is_hand_full():
			if Global.clicks_actuales < Global.max_clicks:
				Global.clicks_actuales += 1
				if player_deck.is_empty():
					return 
				var random_index = randi() % player_deck.size()
				var card_draw = player_deck[random_index]
				var card_name = card_draw[0]
				var id_card = player_deck[random_index]
				var script_path = card_database_reference.CARDS[card_draw][3]
				var card_script = load(script_path)
				player_deck.erase(card_draw)
				var card_scene = load("res://Scenes/card1.tscn")
				var new_card = card_scene.instantiate()
				new_card.set_script(card_script)
				var card_image_path = str("res://Imagenes/Cartas/" + id_card + "Card.png")
				new_card.get_node("CardImage").texture = load(card_image_path)
				if new_card.has_node("Valor") and new_card.has_node("Energy"):
					new_card.get_node("Valor").text = str(card_database_reference.CARDS[card_draw][0])
					new_card.get_node("Energy").text = str(card_database_reference.CARDS[card_draw][1])
					new_card.valor = str(card_database_reference.CARDS[card_draw][0])
					$"../CardManager".add_child(new_card)
					new_card.name = "Card"
					$"../PlayerHand".add_card_to_hand(new_card, card_draw_speed)

func _process(delta: float) -> void:
	var restantes = Global.max_clicks - Global.clicks_actuales
	label.text = str(restantes)
