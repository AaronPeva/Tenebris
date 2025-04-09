extends Node2D

@onready var atacar = $Boton1
@onready var salir = $Boton2
signal clic_personal
func _ready():
	var escena_cargada = load(Global.escena_seleccionada)
	atacar.visible = false
	salir.visible = false
	if escena_cargada is PackedScene:  # Verificar que sea una escena válida
		var instancia = escena_cargada.instantiate()  # Instanciar la escena
		instancia.position = Vector2(600, 400) 
		add_child(instancia) 
		if instancia.has_signal("clic_personal"):
			instancia.connect("clic_personal", _on_input_event)
			emit_signal("clic")
		print("✅ Escena añadida correctamente")
		print(instancia)
	else:
		print("⚠ Error: La ruta no contiene una escena válida ->", Global.escena_seleccionada)


func _on_input_event():
	_visible()# Emitimos la señal al hacer clic


func _visible() -> void:
	atacar.visible = true
	salir.visible = true


func _on_boton_salir_pressed() -> void:
	atacar.visible = false
	salir.visible = false# Replace with function body.
