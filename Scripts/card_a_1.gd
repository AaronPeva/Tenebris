extends Node2D

signal hovered
signal hovered_off

var starting_position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self) # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self) # Replace with function body.
