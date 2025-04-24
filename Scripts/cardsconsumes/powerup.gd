extends "res://Scripts/card.gd"


	#var contador
# recordatior que podemos invocar al padre	
#func _delete_card() -> void:
	#if contador != 0:
		#contador = contador - 1 
	#else:
		#super._delete_card()


#var barra : TextureProgressBar
func _ready() -> void:
	super._ready()
	energy_consume = 2
