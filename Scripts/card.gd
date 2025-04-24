extends Node2D

signal hovered
signal hovered_off
var starting_position
var card_slot_card_is_in
var attack
var barra_vida

var energy_consume = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().connect_card_signals(self) # Replace with function body.
	barra_vida = get_node("/root/Main/EnergyNode/EnergyBar")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self) # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self) # Replace with function body.


func isPlayerCharacterCard() -> bool:
	return self.scene_file_path == Global.escena_seleccionada

func _consume_card() -> void:
	if barra_vida:
		barra_vida.value -= energy_consume
	else:
		print("⚠️ ¡No tengo barra, coach!")

func _delete_card() -> void:
	queue_free()
