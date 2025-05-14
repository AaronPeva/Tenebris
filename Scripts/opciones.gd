extends Node2D

@export var intensity: float = 2.0  # Ajusta la intensidad del efecto

var original_position: Vector2

func _ready():
	original_position = position

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var screen_center = get_viewport_rect().size / 2
	var offset = (mouse_pos - screen_center) / screen_center * intensity
	position = original_position + offset

func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MENU.tscn")


func resolucion_on_option_button_item_selected(index: int) -> void:
	pass # Replace with function body.
