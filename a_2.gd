extends TextureButton

@onready var vidaJugador

func _pressed2() -> void:
	vidaJugador.value += 3
	if vidaJugador.value > 5:
		vidaJugador.value = 5

func _pressed() -> void:
	queue_free()
