extends Control

# Configuración
const CONFIG_PATH = "user://settings.cfg"
var config = {
	"master_volume": 50,
	"resolution": 0,
	"mouse_sensitivity": 50
}

# Opciones de resolución
var resolutions = [
	{"name": "1024x768", "width": 1024, "height": 768},
	{"name": "1280x720 (HD)", "width": 1280, "height": 720},
	{"name": "1366x768", "width": 1366, "height": 768},
	{"name": "1600x900", "width": 1600, "height": 900},
	{"name": "1920x1080 (Full HD)", "width": 1920, "height": 1080}
]

# Nodos UI
@onready var volume_slider: HSlider = $VBoxContainer/Volume/HSlider
@onready var resolution_option: OptionButton = $VBoxContainer/Resolution/OptionButton
@onready var mouse_slider: HSlider = $VBoxContainer/Mouse/HSlider
@onready var apply_button: Button = $VBoxContainer/Aplicar
@onready var back_button: Button = $VBoxContainer/Volver

func _ready():
	resolution_option.item_selected.connect(_on_resolution_changed)
	# Configurar opciones de resolución

	for res in resolutions:
		resolution_option.add_item(res["name"])
	
	# Conectar señales
	volume_slider.value_changed.connect(_on_volume_changed)
	mouse_slider.value_changed.connect(_on_mouse_sensitivity_changed)
	apply_button.pressed.connect(_on_apply_pressed)
	#back_button.pressed.connect(_on_back_pressed)
	
	# Cargar configuración
	load_settings()

func load_settings():
	var config_file = ConfigFile.new()
	var err = config_file.load(CONFIG_PATH)
	
	if err == OK:
		config["master_volume"] = config_file.get_value("audio", "master_volume", 50)
		config["resolution"] = config_file.get_value("video", "resolution", 0)
		config["mouse_sensitivity"] = config_file.get_value("controls", "mouse_sensitivity", 50)
	else:
		save_settings()
	
	# Aplicar valores a la UI
	volume_slider.value = config["master_volume"]
	resolution_option.selected = config["resolution"]
	mouse_slider.value = config["mouse_sensitivity"]
	
	# Aplicar cambios inmediatos (excepto resolución)
	_apply_audio_settings()
	_apply_mouse_settings()

func save_settings():
	var config_file = ConfigFile.new()
	config_file.set_value("audio", "master_volume", config["master_volume"])
	config_file.set_value("video", "resolution", config["resolution"])
	config_file.set_value("controls", "mouse_sensitivity", config["mouse_sensitivity"])
	config_file.save(CONFIG_PATH)

func _on_volume_changed(value: float) -> void:
	config["master_volume"] = value
	_apply_audio_settings()

func _on_mouse_sensitivity_changed(value: float) -> void:
	config["mouse_sensitivity"] = value
	_apply_mouse_settings()

func _on_apply_pressed() -> void:
	save_settings()
	_apply_video_settings(true)

func _on_back_pressed() -> void:
	queue_free()

func _apply_audio_settings() -> void:
	var db_volume := linear_to_db(config["master_volume"] / 100.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db_volume)

func _apply_video_settings(force: bool = false) -> void:
	var selected_res = resolutions[config["resolution"]]
	var new_size = Vector2i(selected_res["width"], selected_res["height"])

	var current_size = DisplayServer.window_get_size()

	if force or current_size != new_size:
		# Cambiar el tamaño de la ventana
		DisplayServer.window_set_size(new_size)

		# Actualizar escala de contenido
		get_tree().root.content_scale_size = new_size
		get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_VIEWPORT
		get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_EXPAND

		# Centrar ventana en modo windowed
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
			var screen_size = DisplayServer.screen_get_size()
			DisplayServer.window_set_position((screen_size - new_size) / 2)

		print("Resolución cambiada a: ", selected_res["name"])



func _apply_mouse_settings() -> void:
	var sensitivity = config["mouse_sensitivity"] / 50.0  # Rango entre 0.5 y 2.0
	
	# Aquí puedes aplicar sensibilidad según tu lógica de juego
	
	# Ejemplo: ajustar velocidad de un cursor personalizado
	#if has_node("/root/Main/CustomCursor"):
	#	get_node("/root/Main/CustomCursor").speed_multiplier = sensitivity
	
	print("Sensibilidad del ratón ajustada a: ", sensitivity)


func _on_resolution_changed(index: int):
	config["resolution"] = index
