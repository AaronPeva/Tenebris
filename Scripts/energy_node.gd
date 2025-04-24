extends Node2D

@onready var barra = $EnergyBar
var ya_sumado = false

func _process(delta):
	if Global.puede_jugar and not ya_sumado:
		barra.value += 1
		ya_sumado = true  # Se asegura de no sumar más mientras siga en true
	elif not Global.puede_jugar:
		ya_sumado = false  # Se resetea cuando Global.puede_jugar vuelve a false
