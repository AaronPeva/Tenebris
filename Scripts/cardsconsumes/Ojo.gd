extends "res://Scripts/card/card.gd"

@onready var main_scene = get_node("/root/Main")

func actualizar_texto():
	descripcion_texto = "Elimina el evento activo del campo, neutralizando su efecto."

func accion_consumible():
	super.accion_consumible()
	add_child(main_scene)
	main_scene.niebla_azul_finalizar()
	main_scene.viento_finalizar()
