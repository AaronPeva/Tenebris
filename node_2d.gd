extends Node2D



@onready var cartas = $GCardHandLayout.get_children()
@onready var vidaJugador = $vidaA
@onready var vidaEnemigo = $vidaE
@onready var enemyTimer = $Timer

func _ready() -> void:
	#$GCardHandLayout/TextureButton.vidaEnemigo = $vidaE
	#$GCardHandLayout/TextureButton2.curar = $vidaE
	#$GCardHandLayout/TextureButton3.vidaJugador = $vidaA
	$GCardHandLayout/TextureButton.pressed.connect(
		func(): _cuandoJugadorClicka())


var turnoJugador = true

func _cuandoJugadorClicka() -> void:
	if turnoJugador:
		vidaEnemigo.value -= 1
	#else:
		turnoJugador = false
		_esperarTurnoEnemigo()

func _esperarTurnoEnemigo() -> void:
	enemyTimer.start()
	_turnoEnemigo()


func _turnoEnemigo() -> void:
	if not turnoJugador:
		vidaJugador.value -= 1
	#else:
		turnoJugador = true
