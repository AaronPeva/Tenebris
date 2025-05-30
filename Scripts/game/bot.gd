extends Node

var turno_bot = false
var en_turno = false
var timer : Timer 

func _ready():
	timer = $TimerBot
	timer.timeout.connect(_on_TimerBot_timeout)
	timer.stop()

func cambiar_turno():
	if not Global.puede_jugar:
		print("ScriptBot: Turno del bot en 5 segundos...")
		timer.start(5)

func _on_TimerBot_timeout():
	timer.stop()
	print("ScriptBotTimer: Turno del jugador")
	Global.puede_jugar = true
