extends Node2D

@export var intensity: float = 3.0  # Ajusta la intensidad del efecto
var original_position: Vector2

func _ready():
	original_position = position
	_load_settings()  # Cargar configuración al iniciar
	
	# Configurar el volumen inicial
	var initial_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	if initial_volume == -80:  # Si está en silencio (valor por defecto)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(0.7))

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var screen_center = get_viewport_rect().size / 2
	var offset = (mouse_pos - screen_center) / screen_center * intensity
	position = original_position + offset

func _load_settings():
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		# Aplicar volumen
		var vol = config.get_value("audio", "volume", 0.7)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(vol))
		
		# Aplicar pantalla completa
		var is_fullscreen = config.get_value("video", "fullscreen", false)
		if is_fullscreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_personajes_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/personajes.tscn")

func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/opciones.tscn")

func _on_puntuaciones_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/puntuaciones.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()
