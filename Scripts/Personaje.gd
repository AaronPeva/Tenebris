extends Object

class_name Personaje

var imagen: Texture2D
var attack: int
var energy: int
var health: int
var escena: String = ""

func _init(img: Texture2D, atk: int, en: int, hp: int, escena_path: String = ""):
	self.imagen = img
	self.attack = atk
	self.energy = en
	self.health = hp
	self.escena = escena_path
