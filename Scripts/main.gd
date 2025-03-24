extends Node2D

@onready var carta_sprite = $Carta  # Nodo donde se muestra la imagen de la carta
@onready var texture_rect = $Panel/TextureRect
@onready var stats_label = $Panel/Label




func _ready():
	if Global.carta_seleccionada:
		var carta = Global.carta_seleccionada
		print("Carta seleccionada:", carta)  # Verifica si se está pasando correctamente

		# Verifica que la imagen exista antes de asignarla
		if carta.imagen and carta.imagen is Texture2D:
			carta_sprite.texture = carta.imagen
		else:
			print("Error: la carta no tiene una imagen válida")

		stats_label.text = "Ataque: %d\nEnergía: %d\nVida: %d" % [carta.attack, carta.energy, carta.health]
	else:
		print("No hay carta seleccionada")
