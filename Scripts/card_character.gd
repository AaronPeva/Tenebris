extends "res://Scripts/card.gd"

@onready var atacar = $Boton1
@onready var salir = $Boton2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#salir.connect("pressed", _on_salir_pressed)


#func _on_input_event(viewport, event, shape_idx):
	#if event is InputEventMouseButton and event.pressed:
		#_on_button_presses()
#
#func _on_button_presses():
	#atacar.visible = true
	#salir.visible = true
#
#func _on_salir_pressed():
	#atacar.visible = false
	#salir.visible = false# Ocultar botones al hacer clic en "Salir"
