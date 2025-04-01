extends Node2D


func _ready():
		var escena_cargada = load(Global.escena_seleccionada)  # Cargar la escena desde la ruta
		if escena_cargada is PackedScene:  # Verificar que sea una escena válida
			var instancia = escena_cargada.instantiate()  # Instanciar la escena
			instancia.position = Vector2(600, 256)  # Posición en la pantalla
			add_child(instancia)  # Agregar la escena como hijo
			print("✅ Escena añadida correctamente")
		else:
			print("⚠ Error: La ruta no contiene una escena válida ->", Global.escena_seleccionada)
			
	## Verificar si hay una carta seleccionada
	#if Global.carta_seleccionada != null:
		## Instanciar la carta (Godot 4 usa instantiate(), Godot 3.x usa instance())
		#var carta_instancia = Global.carta_seleccionada.instantiate()
		#
		## Añadirla a la escena
		#add_child(carta_instancia)
		#
		## Posicionar la carta
		#carta_instancia.position = Vector2(100, 100)
		#
		# Opcional: Configurar propiedades adicionales
		# carta_instancia.set_property(value) Ajusta las coordenadas

#func _ready():
	#if Global.carta_seleccionada:
		#var carta = Global.carta_seleccionada
		#
		#print("Carta seleccionada:", carta)  # Verifica si se está pasando correctamente
#
		## Verifica que la imagen exista antes de asignarla
		#if carta.imagen:
			#carta_sprite.texture = carta.imagen
		#else:
			#print("Error: la carta no tiene una imagen válida")
#
		#stats_label.text = "Ataque: %d\nEnergía: %d\nVida: %d" % [carta.attack, carta.energy, carta.health]
	#else:
		#print("No hay carta seleccionada")
