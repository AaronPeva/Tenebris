extends Node2D

@onready var energ = $TextEnerg
var ya_sumado = false

func _ready():
	energ.text = "4"
	actualizar_color(3)

func _process(delta):
	if energ.text > str(5):
		energ.text = "5"
	if Global.puede_jugar and not ya_sumado:
		var valor_actual = int(energ.text)
		valor_actual = min(valor_actual + 1, 5)
		valor_actual = max(valor_actual, 0)
		energ.text = str(valor_actual)
		ya_sumado = true
		actualizar_color(valor_actual)
	
	elif not Global.puede_jugar:
		ya_sumado = false 

func actualizar_color(valor):
	match valor:
		3:
			energ.modulate = Color(1, 0.6, 0)  # Naranja
		2:
			energ.modulate = Color(1, 0.4, 0)  # Rojo claro
		1:
			energ.modulate = Color(1, 0, 0)    # Rojo
		0:
			energ.modulate = Color(0.6, 0, 0)  # Rojo fuerte
		_:
			energ.modulate = Color(1, 1, 1)    # Blanco



func _on_atacar_pressed() -> void:
	var valor_actual = int(energ.text)
	if valor_actual >= Global.attack_cost:
		valor_actual -= Global.attack_cost
		energ.text = str(valor_actual)
		actualizar_color(valor_actual)
	else:
		pass
