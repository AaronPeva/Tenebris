extends Control

var resolutions := [
	Vector2i(1280, 720),
	Vector2i(1600, 900), 
	Vector2i(1920, 1080)
]

var mouse_sensitivity: float = 1.0
var current_resolution_index := 0
var is_fullscreen := false

# Referencias con las rutas exactas de tu estructura
@onready var volume_slider: HSlider = $VBoxContainer/Volume/HSlider
@onready var sensitivity_slider: HSlider = $VBoxContainer/Mouse/HSlider
@onready var resolution_option: OptionButton = $VBoxContainer/Resolution/OptionButton  # Nota: OptionButt en tu estructura
@onready var fullscreen_checkbox: CheckBox = $VBoxContainer/Fullscreen/CheckBox

func _ready():
	# Verificación crítica de nodos
	_verify_nodes()
	
	# Configuración inicial
	_setup_resolution_options()
	_load_settings()
	
	# Conexión de señales
	_connect_signals()

func _verify_nodes():
	if not resolution_option:
		printerr("ERROR CRÍTICO: No se encontró OptionButt en $VBoxContainer/Resolution/OptionButt")
	if not fullscreen_checkbox:
		printerr("ERROR CRÍTICO: No se encontró CheckBox en $VBoxContainer/HBoxContainer/Fullscreen/CheckBox")

func _setup_resolution_options():
	if resolution_option:
		resolution_option.clear()
		for i in range(resolutions.size()):
			var res = resolutions[i]
			resolution_option.add_item("%dx%d" % [res.x, res.y])
		resolution_option.selected = current_resolution_index

func _connect_signals():
	if sensitivity_slider:
		sensitivity_slider.value_changed.connect(mouse_on_h_slider_value_changed)
	if resolution_option:
		resolution_option.item_selected.connect(resolucion_on_option_button_item_selected)
	if fullscreen_checkbox:
		fullscreen_checkbox.toggled.connect(fullscreen_on_check_box_toggled)

# VOLUMEN
func _on_volume_changed(value: float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))

# SENSIBILIDAD (señal: mouse_on_h_slider_value_changed)
func mouse_on_h_slider_value_changed(value: float):
	mouse_sensitivity = value
	print("Sensibilidad del ratón actualizada:", value)

# RESOLUCIÓN (señal: resolucion_on_option_button_item_selected)
func resolucion_on_option_button_item_selected(index: int):
	current_resolution_index = index
	_apply_resolution()

func _apply_resolution():
	if not resolution_option:
		return
		
	var selected_res = resolutions[current_resolution_index]
	
	if is_fullscreen:
		# Secuencia especial para fullscreen
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(selected_res)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_size(selected_res)
		_center_window(selected_res)
	
	print("Resolución cambiada a:", selected_res)

func _center_window(size: Vector2i):
	var screen_size = DisplayServer.screen_get_size()
	var window_position = (screen_size - size) / 2
	DisplayServer.window_set_position(window_position)

# FULLSCREEN (señal: fullscreen_on_check_box_toggled)
func fullscreen_on_check_box_toggled(toggled_on: bool):
	is_fullscreen = toggled_on
	
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		# Aplicar resolución actual al salir de fullscreen
		_apply_resolution()
	
	print("Pantalla completa:", toggled_on)

# BOTÓN APLICAR
func _on_aplicar_pressed():
	_save_settings()
	print("Configuración aplicada")

# BOTÓN SALIR
func _on_salir_pressed():
	get_tree().quit()  # O hide() para solo cerrar el menú

# GUARDAR CONFIGURACIÓN
func _save_settings():
	var config = ConfigFile.new()
	
	# Audio
	if volume_slider:
		config.set_value("audio", "volume", volume_slider.value)
	
	# Controles
	config.set_value("input", "sensitivity", mouse_sensitivity)
	
	# Video
	if resolution_option:
		config.set_value("video", "resolution_index", current_resolution_index)
	config.set_value("video", "fullscreen", is_fullscreen)
	
	if config.save("user://settings.cfg") != OK:
		printerr("Error al guardar configuración")

# CARGAR CONFIGURACIÓN
func _load_settings():
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		# Volumen
		if volume_slider:
			volume_slider.value = config.get_value("audio", "volume", 0.7)
			_on_volume_changed(volume_slider.value)
		
		# Sensibilidad
		mouse_sensitivity = config.get_value("input", "sensitivity", 1.0)
		if sensitivity_slider:
			sensitivity_slider.value = mouse_sensitivity
		
		# Resolución
		current_resolution_index = config.get_value("video", "resolution_index", 0)
		if resolution_option:
			resolution_option.selected = current_resolution_index
		
		# Pantalla completa
		is_fullscreen = config.get_value("video", "fullscreen", false)
		if fullscreen_checkbox:
			fullscreen_checkbox.button_pressed = is_fullscreen
			fullscreen_on_check_box_toggled(is_fullscreen)
	else:
		print("Cargando configuración por defecto")
