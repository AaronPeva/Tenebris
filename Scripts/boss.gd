extends Node2D

var boss_damage = 10
var player_damage = Global.attack_damage
var fallado = false
@onready var miss_label = $Miss
@onready var critical_label = $Critical
@onready var boss_health = $BossAnimatedSprite/CanvasLayer/vidabot

func _ready() -> void:
	$BossAnimatedSprite.play()
	$BossAnimatedSprite.visible = true
	$AttackAnimation.visible = false
	$HurtAnimation.visible = false
	miss_label.visible = false
	critical_label.visible = false
	
func _on_atacar_pressed() -> void:
	var final_damage = await damage_prob()
	if not fallado:
		AnimacionDolido()
	fallado = false
	boss_health.value -= final_damage
	await get_tree().create_timer(2.0).timeout
	AnimacionAtacar()
	await get_tree().create_timer(0.4).timeout
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
	
func damage_prob() -> int:
	var prob = randi() % 100
	if prob < 10:
		miss_label.visible = true
		await get_tree().create_timer(0.5).timeout
		miss_label.visible = false
		fallado = true
		return 0  # fallo
	elif prob < 20:
		critical_label.visible = true
		await get_tree().create_timer(0.5).timeout
		critical_label.visible = false
		return player_damage * 2  # crítico
	else:
		return player_damage  # daño normal
		
