extends Node2D

const CARD_SCENE_PATH = "res://Scenes/card1.tscn"
const card_draw_speed = 0.3

var player_deck = ["Knight"]
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func draw_card():
	var card_draw = player_deck[0]
	player_deck.erase(card_draw)
	
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, card_draw_speed)
