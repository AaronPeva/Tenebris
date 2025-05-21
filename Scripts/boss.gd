extends Node2D

var boss_damage = 10
var player_damage = Global.attack_damage
var fallado = false
var critico = false
@onready var miss_label = $Miss
@onready var critical_label = $Critical
@onready var boss_health = $BossAnimatedSprite/CanvasLayer/vidabot
@onready var attack_sound = $AttackSound
@onready var critical_sound = $CriticSound
var main = get_parent()

func _ready() -> void:
	$BossAnimatedSprite.play()
	$BossAnimatedSprite.visible = true
	$AttackAnimation.visible = false
	$HurtAnimation.visible = false
	$MissAnimation.visible = false
	$CriticalAnimation.visible = false
	
func _on_atacar_pressed() -> void:
	var final_damage = await damage_prob()
	if not fallado:
		AnimacionDolido()
		attack_sound.play()
	if critico:
		critical_sound.play()
	critico = false
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

func AnimacionCritico():
	$CriticalAnimation.visible = true
	$CriticalAnimation.play()

func AnimacionFallar():
	$MissAnimation.visible = true
	$MissAnimation.play()


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
	var fallo_chance = 10 
	if Global.niebla_activa:
		fallo_chance += 30
	if prob < fallo_chance:
		AnimacionFallar()
		fallado = true
		return 0  # fallo
	elif prob < 20:
		AnimacionCritico()
		critico = true
		return player_damage * 2  # crítico

	else:
		return player_damage  # daño normal



func _on_miss_animation_animation_finished() -> void:
	$MissAnimation.visible = false


func _on_critical_animation_animation_finished() -> void:
	$CriticalAnimation.visible = false
