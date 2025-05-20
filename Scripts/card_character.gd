extends "res://Scripts/card.gd"
@onready var bot = $Bot
@onready var atacar = $Boton1
@onready var salir = $Boton2
var last_text: String = ""
var damage = 1
var Area = Area2D
var carta_activa

signal clic_personal
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	carta_activa = $Health
	$HealthBoxAnimation.visible = false

func _process(delta: float) -> void:
	carta_activa.text = str(Global.hp_carta_jugador)
	if carta_activa.text != last_text:
		last_text = carta_activa.text
		caja_dolida()
		print ("Vida tocada")
	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if Global.puede_jugar:
			emit_signal("clic_personal")


#func _on_area_2d_area_entered(area: Area2D) -> void:
	#var card = area.get_parent()
	#card._consume_card()
	#var hand_manager = get_node("/root/Main/PlayerHand")  # Ajusta esta ruta a tu escena
	#if hand_manager:
		#hand_manager.remove_card_from_hand(card)
		#card.queue_free()
	#

func _recibir_daño():
	var carta_activa = $Health
	carta_activa.text = str(int(carta_activa.text) - damage)
	
func caja_dolida():
	$HealthBox.visible = false
	$HealthBoxAnimation.visible = true
	$HealthBoxAnimation.play()


func _on_health_box_animation_animation_finished() -> void:
	$HealthBoxAnimation.visible = false
	$HealthBox.visible = true
