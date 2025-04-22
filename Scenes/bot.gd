extends Node

# Variables de turno
var turno_jugador = true  # El jugador empieza
var en_turno = false  # Estado del turno
var timer : Timer  # Referencia al temporizador
# Ejemplo de cartas del BOT (puedes tener una estructura más compleja de cartas)

func _ready():
	timer = $TimerBot
	timer.timeout.connect(_on_TimerBot_timeout) #referimos al contador terminado
	timer.stop() #que empiece quieto

# Función para cambiar el turno
func cambiar_turno():
	if turno_jugador:
		en_turno = false
		Global.abrirbotones = false
		print("ScriptBot: Turno del bot")
		print("El contador empieza")
		if timer.is_stopped():
				timer.start(5)
	else:
		en_turno = true
		Global.abrirbotones = true
		print("ScriptBot: Turno del jugador")
		timer.stop()

func _on_TimerBot_timeout():
	timer.stop()
	print("El contador termina")
	turno_jugador = true
	print("ScriptBotTimer: Turno del jugador")
	Global.abrirbotones = true
	print("ScriptBotTimer: Se habilita los botones")
