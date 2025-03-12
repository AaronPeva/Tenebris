extends Node2D

const CARD_SCENE_PATH = "res://Scenes/card1.tscn"
const card_draw_speed = 0.3

var player_deck = ["Knight"]
var card_database_reference
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	player_deck.shuffle()
	card_database_reference = preload("res://Scripts/CardDatabase.gd")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func draw_card():
	var card_draw = player_deck[0]
	player_deck.erase(card_draw)
	
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str(player_deck.size())
	new_card.get_node("Attack").text = str(card_database_reference.CARDS[card_draw][0])
	new_card.get_node("Energy").text = str(card_database_reference.CARDS[card_draw][1])

	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, card_draw_speed)
