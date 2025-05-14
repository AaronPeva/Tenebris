extends Node2D

var boss_damage = 8
var player_damage = 5

@onready var boss_health = $BossAnimatedSprite/CanvasLayer/vidabot

func _ready() -> void:
	$BossAnimatedSprite.play()
	$BossAnimatedSprite.visible = true
	$AttackAnimation.visible = false
	$HurtAnimation.visible = false

func _on_atacar_pressed() -> void:
	AnimacionDolido()
	boss_health.value -= player_damage
	await get_tree().create_timer(2.0).timeout
	AnimacionAtacar()
	await get_tree().create_timer(0.5).timeout
	Global.hp_carta_jugador -= boss_damage
	if Global.hp_carta_jugador < 0:
		Global.hp_carta_jugador = 0

func _on_saltar_pressed() -> void:
	await get_tree().create_timer(2.0).timeout
	AnimacionAtacar()
	await get_tree().create_timer(0.5).timeout
	Global.hp_carta_jugador -= boss_damage
	if Global.hp_carta_jugador < 0:
		Global.hp_carta_jugador = 0


func AnimacionAtacar():
	$BossAnimatedSprite.visible = false
	$AttackAnimation.visible = true
	$AttackAnimation.play()
	
func AnimacionDolido():
	$BossAnimatedSprite.visible = false
	$HurtAnimation.visible = true
	$HurtAnimation.play()

func _on_attack_animation_animation_finished() -> void:
	$AttackAnimation.visible = false
	$BossAnimatedSprite.visible = true

func _on_hurt_animation_animation_finished() -> void:
	$HurtAnimation.visible = false
	$BossAnimatedSprite.visible = true
