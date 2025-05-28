extends Control

@onready var volume_slider: HSlider = $Volumen/HSlider
@onready var fullscreen_checkbox: CheckBox = $Fullscreen/CheckBox
@onready var aplicar_btn: Button = $Aplicar
@onready var salir_btn: Button = $Salir

var is_fullscreen := false

func _ready():
	# Cargar configuración antes de conectar señales
	_load_settings()
	
	# Conexión de señales
	volume_slider.value_changed.connect(_on_volume_changed)
	fullscreen_checkbox.toggled.connect(_on_fullscreen_checkbox_toggled)
	aplicar_btn.pressed.connect(_on_aplicar_pressed)
	salir_btn.pressed.connect(_on_salir_pressed)

func _on_volume_changed(value: float):
	# Aplicar volumen inmediatamente
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
	_save_settings()  # Guardar automáticamente al cambiar

func _on_fullscreen_checkbox_toggled(toggled_on: bool):
	is_fullscreen = toggled_on
	# Aplicar inmediatamente y guardar
	_apply_fullscreen()
	_save_settings()

func _on_aplicar_pressed():
	_save_settings()
	print("Configuración aplicada como un buen 200 pump 🎯")

func _on_salir_pressed():
	get_tree().change_scene_to_file("res://Scenes/MENU.tscn")
	print("Saliste del menú como un ninja 🕶️")

func _apply_fullscreen():
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _save_settings():
	var config = ConfigFile.new()
	config.set_value("audio", "volume", volume_slider.value)
	config.set_value("video", "fullscreen", is_fullscreen)
	if config.save("user://settings.cfg") != OK:
		printerr("Error al guardar configuración")

func _load_settings():
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		# Cargar y aplicar volumen
		var vol = config.get_value("audio", "volume", 0.7)
		volume_slider.value = vol
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(vol))
		
		# Cargar y aplicar pantalla completa
		is_fullscreen = config.get_value("video", "fullscreen", false)
		fullscreen_checkbox.button_pressed = is_fullscreen
		_apply_fullscreen()
	else:
		# Configuración por defecto
		volume_slider.value = 0.7
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(0.7))
		is_fullscreen = false
		fullscreen_checkbox.button_pressed = false
		_apply_fullscreen()
		print("Cargando configuración por defecto 🎮")
