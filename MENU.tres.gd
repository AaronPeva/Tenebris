extends Node2D


func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://opciones.tscn")


func _on_puntuaciones_pressed() -> void:
	get_tree().change_scene_to_file("res://puntuaciones.tscn")


func _on_salir_pressed() -> void:
	get_tree().quit()
