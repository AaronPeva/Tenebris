extends Node2D

@onready var timer = $timer
@onready var atacar = $Atacar
@onready var salir = $Salir
@onready var saltar = $Saltar
@onready var indicadorturno = $IndicadorTurno
@onready var energy_node = $EnergyNode
@onready var atacar_button = $Atacar
@onready var insuficiente = $EnergiaInsuficiente


signal clic_personal

func _ready():
	var escena_cargada = load(Global.escena_seleccionada)
	atacar.visible = false
	salir.visible = false
	insuficiente.visible = false
	if escena_cargada is PackedScene:  # Verificar que sea una escena válida
		var instancia = escena_cargada.instantiate()  # Instanciar la escena
		instancia.position = Vector2(976, 680) 
		add_child(instancia) 
		if instancia.has_signal("clic_personal"):
			instancia.connect("clic_personal", _on_input_event)
		print("✅ Escena añadida correctamente")
	else:
		print("⚠ Error: La ruta no contiene una escena válida ->", Global.escena_seleccionada)
		
func _process(delta):
	saltar.visible = Global.puede_jugar
	if Global.puede_jugar:
		indicadorturno.text = "Tu turno"
	else:
		indicadorturno.text = "Turno del rival"
	var energia_actual = int(energy_node.energ.text)
	if energia_actual < Global.attack_cost:
		atacar_button.disabled = true
	else:
		atacar_button.disabled = false

func _on_input_event():
	_visible()
	var energia_actual = int(energy_node.energ.text)
	if energia_actual < Global.attack_cost:
		insuficiente.visible = true
	else:
		insuficiente.visible = false

func _visible() -> void:
	atacar.visible = true
	salir.visible = true

func _on_boton_salir_pressed() -> void:
	atacar.visible = false
	salir.visible = false# Replace with function body.
	insuficiente.visible = false

func _on_atacar_pressed() -> void:
	if Global.puede_jugar:
		Global.puede_jugar = false
		print("ScriptMain: Turno del jugador")
		atacar.visible = false
		salir.visible = false
		saltar.visible = false
		timer.cambiar_turno()


func _on_saltar_pressed() -> void:
	if Global.puede_jugar:
		Global.puede_jugar = false
		print("ScriptMain: Turno del jugador")
		atacar.visible = false
		salir.visible = false
		saltar.visible = false
		timer.cambiar_turno()
		insuficiente.visible = false



func _on_area_2d_area_entered(area: Area2D) -> void:
	var nodo = area.get_parent()
	if nodo.is_in_group("cartas"):
		nodo.accion_consumible()


func _on_timer_bot_timeout() -> void:
	pass # Replace with function body.
