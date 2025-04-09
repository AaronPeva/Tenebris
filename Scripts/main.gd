extends Node2D

@onready var atacar = $Boton1
@onready var salir = $Boton2

func _ready():
	var escena_cargada = load(Global.escena_seleccionada)
	atacar.visible = false
	salir.visible = false
	if escena_cargada is PackedScene:  # Verificar que sea una escena válida
		var instancia = escena_cargada.instantiate()  # Instanciar la escena
		instancia.position = Vector2(600, 256) 
		#if instancia.has_signal("input_event"):
			#instancia.connect("input_event", _on_input_event) # Posición en la pantalla
		add_child(instancia)  # Agregar la escena como hijo
		print("✅ Escena añadida correctamente")
		
	else:
		print("⚠ Error: La ruta no contiene una escena válida ->", Global.escena_seleccionada)


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		_visible()


func _visible() -> void:
	atacar.visible = true
	salir.visible = true


func _on_boton_salir_pressed() -> void:
	atacar.visible = false
	salir.visible = false# Replace with function body.
