extends Node2D

@onready var barra = $EnergyBar
var ya_sumado = false
@onready var carta_escena = preload("res://Scenes/card1.tscn")

 # ¡Le pasamos la barra como en un buen pase lateral!
	
func _process(delta):
	if Global.puede_jugar and not ya_sumado:
		barra.value += 1
		ya_sumado = true  # Se asegura de no sumar más mientras siga en true
	elif not Global.puede_jugar:
		ya_sumado = false  # Se resetea cuando Global.puede_jugar vuelve a false
