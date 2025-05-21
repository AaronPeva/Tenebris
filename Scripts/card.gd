extends Node2D

signal hovered
signal hovered_off
signal bot_attacked
var barra_energia
var energy_consume = 1
var starting_position
var card_slot_card_is_in
var being_removed = false
var valor
@onready var richtext = $Valor
@onready var vidaBoss = get_node("/root/Main/Boss/BossAnimatedSprite/CanvasLayer/vidabot")
@onready var area = get_node("/root/Main/Area/Area2D/AreaImage")
@onready var text_energia = $Energy
@onready var energia_general = get_node("/root/Main/EnergyNode/TextEnerg")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	valor = richtext.text.to_int()
	add_to_group("cartas")
	get_parent().connect_card_signals(self) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self) # Replace with function body.

func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self) # Replace with function body.
	self.z_index = 1


func isPlayerCharacterCard() -> bool:
	return self.scene_file_path == Global.escena_seleccionada


func _remove_card() -> void:
	var hand_manager = get_node("/root/Main/PlayerHand") # Ajusta esta ruta a tu escena
	if hand_manager:
		hand_manager.remove_card_from_hand(self)
		area.visible = false
		self.being_removed = true
		self.queue_free()


func gastar_energia():
	var energia_personal = energia_general.text.to_int()        
	var energia_a_gastar = text_energia.get_text().to_int()     
	energia_personal -= energia_a_gastar
	if energia_personal < 0:
		energia_personal = 0
	energia_general.text = str(energia_personal)



func highlight_card(dragged):
	if dragged:
		self.z_index = 2

func accion_consumible():
	gastar_energia()
	_remove_card()
