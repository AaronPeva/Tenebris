extends TextureButton


var curar : TextureProgressBar

func _pressed() -> void:
	curar.value += 1
	if curar.value > 5:
		curar.value = 5
	queue_free()
