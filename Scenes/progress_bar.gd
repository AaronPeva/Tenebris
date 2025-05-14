extends ProgressBar

@onready var vidavalor = get_parent().get_node("Health")
var sincronizado = false
var health_value = 0

func _ready() -> void:
	if not sincronizado:
		health_value = int(vidavalor.text) 
		value = health_value
		max_value = health_value
		sincronizado = true 

#CODIGO PARA PROBAR DAÑO
	#await get_tree().create_timer(3.0).timeout
	#health_value -= 55
	#vidavalor.text = str(health_value)

func _process(delta):
	var current_health = int(vidavalor.text)
	value = current_health 

	# Cambiar el color del texto dependiendo de la vida
	if current_health < max_value * 0.1:
		# Vida muy baja, color rojo
		self_modulate = Color(1, 0, 0)  # Rojo
	elif current_health < max_value * 0.5:
		# Vida por debajo del 50%, color amarillo
		self_modulate = Color(1, 1, 0)  # Amarillo
	else:
		# Vida normal, color verde
		self_modulate = Color(0, 1, 0)  # Verde
