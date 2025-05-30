extends Node2D

var boss_damage = 5
var fallado = false
var critico = false
@onready var miss_label = $Miss
@onready var critical_label = $Critical
@onready var boss_health = get_parent().get_node("vidabot")
@onready var attack_sound = $AttackSound
@onready var critical_sound = $CriticSound

func _ready() -> void:
	$BossCriticalAnimation.visible = false
	$BossMissAnimation.visible = false
	$BossAnimatedSprite.play()
	$BossAnimatedSprite.visible = true
	$AttackAnimation.visible = false
	$HurtAnimation.visible = false
	$MissAnimation.visible = false
	$CriticalAnimation.visible = false
	
	
func _on_atacar_pressed() -> void:
	print(Global.attack_cost) 
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
	var damage_received = damage_boss_prob()
	Global.hp_carta_jugador -= damage_received
	if Global.hp_carta_jugador < 0:
		Global.hp_carta_jugador = 0

func _on_saltar_pressed() -> void:
	await get_tree().create_timer(2.0).timeout
	AnimacionAtacar()
	await get_tree().create_timer(0.5).timeout
	var damage_received = damage_boss_prob()
	Global.hp_carta_jugador -= damage_received
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
	var fallo_chance = Global.fallo_actual
	var crit_chance = Global.critico_actual
	if Global.niebla_activa:
		fallo_chance += 30
	if Global.viento_activo:
		crit_chance += 90
	if prob < fallo_chance:
		AnimacionFallar()
		fallado = true
		return 0
	elif prob < crit_chance:
		AnimacionCritico()
		critico = true
		return Global.attack_damage * 2

	else:
		return Global.attack_damage


func _on_miss_animation_animation_finished() -> void:
	$MissAnimation.visible = false


func _on_critical_animation_animation_finished() -> void:
	$CriticalAnimation.visible = false

func damage_boss_prob() -> int:
	var prob = randi() % 100
	var fallo_chance = Global.boss_fallo_actual
	var crit_chance = Global.boss_critico_actual

	if prob < fallo_chance:
		miss_boss()
		return 0
	elif prob < crit_chance + fallo_chance:
		critico_boss()
		return boss_damage * 2
	else:
		return boss_damage

func critico_boss():
	$BossCriticalAnimation.visible = true
	$BossCriticalAnimation.play()

func _on_boss_critical_animation_animation_finished() -> void:
	$BossCriticalAnimation.visible = false

func miss_boss():
	$BossMissAnimation.visible = true
	$BossMissAnimation.play()

func _on_boss_miss_animation_animation_finished() -> void:
	$BossMissAnimation.visible = false
