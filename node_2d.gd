extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GCardHandLayout/TextureButton.vidaEnemigo = $vidaE
	pass # Replace with function body.
	$GCardHandLayout/TextureButton2.curar = $vidaE
	
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
