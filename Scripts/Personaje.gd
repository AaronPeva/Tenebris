extends Object

class_name Personaje

var imagen: Texture2D
var attack: int
var energy: int
var health: int

func _init(img: Texture2D, atk: int, en: int, hp: int):
	self.imagen = img
	self.attack = atk
	self.energy = en
	self.health = hp
