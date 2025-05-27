extends Node

@onready var volume_slider: HSlider = $Volumen/HSlider
@onready var fullscreen_checkbox: CheckBox = $Fullscreen/CheckBox
@onready var aplicar_btn: Button = $Aplicar
@onready var salir_btn: Button = $Salir

var is_fullscreen := false

func _ready():
	_load_settings()

	# Conexión de señales
	if volume_slider:
		volume_slider.value_changed.connect(_on_volume_changed)
	if fullscreen_checkbox:
		fullscreen_checkbox.toggled.connect(_on_fullscreen_toggled)
	if aplicar_btn:
		aplicar_btn.pressed.connect(_on_aplicar_pressed)
	if salir_btn:
		salir_btn.pressed.connect(_on_salir_pressed)

# Volumen
func _on_volume_changed(value: float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))

# Fullscreen
func _on_fullscreen_toggled(toggled_on: bool):
	is_fullscreen = toggled_on
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# Botón APLICAR
func _on_aplicar_pressed():
	_save_settings()
	print("Configuración guardada... Ready pa' rushear lobby 🛠️💾")

# Botón SALIR
func _on_salir_pressed():
	get_tree().change_scene_to_file("res://Scenes/MENU.tscn")
	print("Saliste del menú como un ninja 🕶️")

# Guardar
func _save_settings():
	var config = ConfigFile.new()
	config.set_value("audio", "volume", volume_slider.value)
	config.set_value("video", "fullscreen", is_fullscreen)
	if config.save("user://settings.cfg") != OK:
		printerr("Error al guardar configuración")

# Cargar
func _load_settings():
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		var vol = config.get_value("audio", "volume", 0.7)
		volume_slider.value = vol
		_on_volume_changed(vol)

		is_fullscreen = config.get_value("video", "fullscreen", false)
		fullscreen_checkbox.button_pressed = is_fullscreen
		_on_fullscreen_toggled(is_fullscreen)
	else:
		print("Cargando configuración por defecto 🎮")
