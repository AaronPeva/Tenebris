extends "res://Scripts/card.gd"

@onready var atacar = $Boton1
@onready var salir = $Boton2
signal clic_personal
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if Global.puede_jugar:
			emit_signal("clic_personal")
		else:
			print("🚫 No puedes jugar ahora, turno del BOT xd")
		
		# Hay que tocar
		# Puede que haya que llamar a la funcion _on_area_2d_input_event
		#(viewport: Node, event: InputEvent, shape_idx: int) cuando empieze por 2 vez el turnoJugador
