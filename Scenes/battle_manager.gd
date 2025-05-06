extends Node2D

var battletimer

func _ready() -> void:
	battletimer = $"../BattleTimer"
	battletimer.one_shot = true
	battletimer.wait_time = 1.0


func _on_saltar_pressed() -> void:
	_turno_bot()


func _turno_bot():
	$"../Bot/BotDeck".draw_card()
	# Esperar
	await battletimer.timeout


#Si le falta vida y tiene cartas de cura, que las use.

#Finalizar turno
