extends "res://Scripts/card.gd"

@onready var atacar = $Boton1
@onready var salir = $Boton2
signal clic_personal
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clic_personal") # Emitimos la señal al hacer clic
