extends Node2D

signal hovered
signal hovered_off
signal bot_attacked
var barra_energia
var energy_consume = 1
var starting_position
var card_slot_card_is_in
var being_removed = false
var descripcion_texto = "..."
@onready var boss = get_node("/root/Main/Boss")
@onready var richtext = $Valor
@onready var vidaBoss = get_node("/root/Main/vidabot")
@onready var area = get_node("/root/Main/Area/Area2D/AreaImage")
@onready var text_energia = $Energy
@onready var energia_general = get_node("/root/Main/EnergyNode/TextEnerg")
@onready var info = get_node("/root/Main/InfoCard")

func _ready() -> void:
	add_to_group("cartas")
	get_parent().connect_card_signals(self) 


func _process(delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self) 

func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self) 
	self.z_index = 1


func isPlayerCharacterCard() -> bool:
	return self.scene_file_path == Global.escena_seleccionada


func _remove_card() -> void:
	var hand_manager = get_node("/root/Main/PlayerHand")
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
		actualizar_texto()
		info.text = descripcion_texto
		info.visible = true
		self.z_index = 2
		print(info.text)
	else:
		info.text = descripcion_texto
		info.visible = false

func actualizar_texto():
	pass


func hacer_accion():
	var energia_actual = energia_general.text.to_int()
	var coste_energia = text_energia.text.to_int()
	if energia_actual >= coste_energia:
		accion_consumible()

func accion_consumible():
	gastar_energia()
	_remove_card()
