extends Node2D

const PORT = 123

const SERVER_ADDRESS = "localhost"

var peer = ENetMultiplayerPeer.new()
@onready var menu = get_node("res://Scenes/MENU.tscn")

@export var player_field_scene : PackedScene
@export var opponent_field_scene : PackedScene

func _on_host_button_pressed() -> void:
	disable_buttons()

	peer.create_server(PORT)

	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(_on_peer_conected)

	var player_scene = player_field_scene.instantiate()
	add_child(player_scene)
	disable_menu()
	
func _on_join_button_pressed() -> void:
	disable_buttons()
	
	peer.create_client(SERVER_ADDRESS, PORT)
	
	multiplayer.multiplayer_peer = peer
	
	var player_scene = player_field_scene.instantiate()
	add_child(player_scene)
	
	var opponent_scene = opponent_field_scene.instantiate()
	add_child(opponent_scene)
	disable_menu()

func disable_buttons():
	$HostButton.disabled = true
	$HostButton.visible = false
	$JoinButton.disabled = true
	$JoinButton.visible = false

func _on_peer_conected(peer_id):
	var opponent_scene = opponent_field_scene.instantiate()
	print("Player se ha unido!🥳")

func disable_menu():
	pass
