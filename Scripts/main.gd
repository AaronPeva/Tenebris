extends Node2D

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
			emit_signal("clic")
		print("✅ Escena añadida correctamente")
		print(instancia)
	else:
		print("⚠ Error: La ruta no contiene una escena válida ->", Global.escena_seleccionada)


func _on_input_event():
	_visible()# Emitimos la señal al hacer clic


func _visible() -> void:
	atacar.visible = true
	salir.visible = true


func _on_boton_salir_pressed() -> void:
	atacar.visible = false
	salir.visible = false# Replace with function body.
	
func cambiar_turno():
	turno_jugador = !turno_jugador  # Cambiar entre jugador y BOT
	en_turno = true
	if turno_jugador:
		print("Es el turno del jugador.")
	else:
		print("Es el turno del BOT.")
		
func procesar_turno():
	if en_turno:
		if turno_jugador:
			print("Es el turno del jugador. El jugador puede jugar.")
			# Aquí agregarás la lógica del jugador (como jugar una carta o algo más)
		else:
			print("Es el turno del BOT. El BOT juega automáticamente.")
			# Aquí agregarás la lógica del BOT (como decidir jugada)
		
		# Al final de cada turno, se pasa al siguiente
		en_turno = false
		cambiar_turno()  # Cambiar de turno


func _on_atacar_pressed() -> void:
	if en_turno:
		procesar_turno()
