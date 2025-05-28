extends "res://Scripts/card.gd"

@onready var main_scene = get_node("/root/Main")  # O la ruta que tenga



func accion_consumible():
	super.accion_consumible()
	add_child(main_scene)
	main_scene.niebla_azul_finalizar()
	main_scene.viento_finalizar()
