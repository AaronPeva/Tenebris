extends Node2D

@onready var timer = $timer
@onready var atacar = $Atacar
@onready var salir = $Salir
@onready var saltar = $Saltar
@onready var indicadorturno = $IndicadorTurno
@onready var energy_node = $EnergyNode
@onready var atacar_button = $Atacar
@onready var insuficiente = $EnergiaInsuficiente
@onready var FogInfo = $FogInfo
@onready var FogTitle = $FogTitle
@onready var area = $Area/Area2D/AreaImage
var contador_turnos_inactivos := 0

signal clic_personal

func _ready():
	$FogAnimation.visible = false
	$FogInfo.visible = false
	$FogTitle.visible = false
	area.visible = false
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
		finalizar_turno()


func _on_saltar_pressed() -> void:
	if Global.puede_jugar:
		Global.puede_jugar = false
		print("ScriptMain: Turno del jugador")
		atacar.visible = false
		salir.visible = false
		saltar.visible = false
		timer.cambiar_turno()
		insuficiente.visible = false
		finalizar_turno()



var carta_dentro: Node = null

func _on_area_2d_area_entered(area: Area2D) -> void:
	var nodo = area.get_parent()

	if nodo.is_in_group("cartas"):
		carta_dentro = nodo



func _on_area_2d_area_exited(area: Area2D) -> void:
	var nodo = area.get_parent()
	if nodo == carta_dentro:
		carta_dentro = null

func _on_timer_bot_timeout() -> void:
	pass # Replace with function body.
	
	
func niebla_azul_empezar():
	$FogAnimation.visible = true
	$FogInfo.visible = true
	$FogTitle.visible = true
	$FogAnimation.play()
	Global.niebla_activa = true
	
func niebla_azul_finalizar():
	$FogAnimation.visible = false
	$FogInfo.visible = false
	$FogTitle.visible = false
	Global.niebla_activa = false
	
func finalizar_turno():
	if Global.puede_jugar == false:
		contador_turnos_inactivos += 1
		var probabilidad := randi() % 100
		if probabilidad < 5:
			niebla_azul_empezar()
			print ("oi oi baka!, la niebla ha comenzado, bakayaro!!!")
		if contador_turnos_inactivos == 3:
			niebla_azul_finalizar()
			contador_turnos_inactivos = 0
