extends Node2D

@onready var bot = $Bot
@onready var atacar = $Atacar
@onready var salir = $Salir

signal clic_personal
var turno_jugador = true
var en_turno = true

func _ready():
	var escena_cargada = load(Global.escena_seleccionada)
	atacar.visible = false
	salir.visible = false
	if escena_cargada is PackedScene:  # Verificar que sea una escena válida
		var instancia = escena_cargada.instantiate()  # Instanciar la escena
		instancia.position = Vector2(600, 400) 
		add_child(instancia) 
		if instancia.has_signal("clic_personal"):
			instancia.connect("clic_personal", _on_input_event)
		print("✅ Escena añadida correctamente")
	else:
		print("⚠ Error: La ruta no contiene una escena válida ->", Global.escena_seleccionada)

func _on_input_event():
	if Global.abrirbotones:
		_visible()
	else:
		print("❌ No es tu turno. No se muestran los botones.")

func _visible() -> void:
	atacar.visible = true
	salir.visible = true


func _on_boton_salir_pressed() -> void:
	atacar.visible = false
	salir.visible = false
	

func cambiar_turno():
	turno_jugador = !turno_jugador
	if turno_jugador:
		en_turno = true
		Global.abrirbotones = true
		print("ScriptMain: Turno del jugador")
	else:
		en_turno = false
		Global.abrirbotones = false
		print("ScriptMain: Turno del bot")
	bot.cambiar_turno()

func _on_atacar_pressed() -> void:
	print("Boton atacar pulsado correctamente satisfactorio buenamente exitosamanete.")
	if en_turno:
		atacar.visible = false
		salir.visible = false
	cambiar_turno()
	atacar.visible = false
	salir.visible = false
