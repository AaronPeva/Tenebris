extends Node

# Variables de turno
var turno_bot = false  # El jugador empieza
var en_turno = false  # Estado del turno
var timer : Timer  # Referencia al temporizador

func _ready():
	timer = $TimerBot
	timer.timeout.connect(_on_TimerBot_timeout)
	timer.stop()

# Función para cambiar el turno
func cambiar_turno():
	if not Global.puede_jugar:
		print("ScriptBot: Turno del bot en 5 segundos...")
		timer.start(5)

func _on_TimerBot_timeout():
	timer.stop()
	print("ScriptBotTimer: Turno del bot")
	Global.puede_jugar = true
