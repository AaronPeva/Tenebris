extends "res://Scripts/card.gd"
@onready var bot = $Bot
@onready var atacar = $Boton1
@onready var salir = $Boton2
var last_text: String = ""
var damage = 1
var Area = Area2D
var carta_activa
@onready var barra_vida = $ProgressBar
@onready var estilo_verde = preload("res://Imagenes/verde.tres")
@onready var estilo_naranja = preload("res://Imagenes/naranja.tres")
@onready var estilo_roja = preload("res://Imagenes/rojo.tres")


signal clic_personal
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	carta_activa = $Health
	$HealthBoxAnimation.visible = false

func _process(delta: float) -> void:
	var vida_actual = Global.hp_carta_jugador
	var vida_maxima = barra_vida.max_value
	var porcentaje = float(vida_actual) / vida_maxima

	barra_vida.value = vida_actual
	carta_activa.text = str(vida_actual)

	if porcentaje > 0.30:
		barra_vida.set("theme_override_styles/fill", estilo_verde)
	elif porcentaje > 0.10:
		barra_vida.set("theme_override_styles/fill", estilo_naranja)
	else:
		barra_vida.set("theme_override_styles/fill", estilo_roja)



	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if Global.puede_jugar:
			emit_signal("clic_personal")

func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)

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
