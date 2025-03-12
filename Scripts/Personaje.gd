extends Object

class_name Personaje

# Constructor del personaje con imagen, salud, ataque y defensa
var imagen
var attack
var energy

func _init(_imagen, _ataque, _energy):
	imagen = _imagen
	attack = _ataque
	energy = _energy
