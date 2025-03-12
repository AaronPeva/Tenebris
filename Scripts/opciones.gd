extends Node2D


func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MENU.tscn")
