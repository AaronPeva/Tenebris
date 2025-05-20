extends TextureProgressBar

@onready var vida = $vidalabel

func _process(delta):
	vida.text = str(value)
	vida.text = str(int(value))
