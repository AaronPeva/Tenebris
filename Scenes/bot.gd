extends Node

# Variables de turno
var turno_jugador = true  # El jugador empieza
var en_turno = false  # Estado del turno
var timer : Timer  # Referencia al temporizador

# Ejemplo de cartas del BOT (puedes tener una estructura más compleja de cartas)

func _ready():
	timer = $TimerBot
	#timer.timeout.connect(_on_TimerBot_timeout)  # En Godot 4 esto es válido
	#timer.stop()
	## 🔥 Empieza el juego con el primer turno asignado
	#cambiar_turno()

# Función para cambiar el turno
func cambiar_turno():
	if turno_jugador:
		en_turno = false
		print("ScriptBot: Turno del bot")
		timer.start(5)
	else:
		en_turno = true
		print("ScriptBot: Turno del jugador")


  # Cambiar entre jugador y BOT
	#en_turno = true
	#if turno_jugador:
		#print("Es el turno del jugador.")
	#else:
		#print("Es el turno del BOT.")
		## Después de 5 segundos, el BOT hace su jugada
		#timer.start(5)  # Iniciar el temporizador con 5 segundos

# Lógica de la acción del turno
#func procesar_turno():
	#if en_turno:
		#if turno_jugador:
			#print("El jugador está jugando.")
			## Aquí va la lógica del jugador (e.g., seleccionar carta)
		#else:
			#print("Es el turno del BOT, esperando 5 segundos...")
			## El BOT no hace nada aquí, espera 5 segundos a que el temporizador se acabe
#
		## Al finalizar el turno, pasamos al siguiente turno
		#en_turno = false
		#cambiar_turno()

# Esta función es llamada cuando el temporizador llega a su fin
func _on_TimerBot_timeout():
	timer.stop()
	turno_jugador = true
	cambiar_turno()
	print("ScriptBotTimer: Turno del jugador")
