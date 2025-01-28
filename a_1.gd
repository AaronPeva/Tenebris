extends TextureButton

@onready var vidaEnemigo
func _pressed1()-> void:
	vidaEnemigo.value -= 2
	if vidaEnemigo.value < 0:
		vidaEnemigo.value = 0

func _pressed() -> void:
	queue_free()
