extends CharacterBody2D


var movement_speed = 40.0
var hp = 80
var maxhp = 80
var last_movement = Vector2.UP


func _ready():
   
	pass


func _on_changetime(time: int):
	print("Time has changed to:", time)

var experience = 0
var experience_level = 1
var collected_experience = 0

var iceSpear = preload("res://Player/Attack/ice_spear.tscn")


@onready var iceSpearTimer = $IceSpearTimer
@onready var iceSpearAttackTimer = $IceSpearAttackTimer


var collected_upgrades = []
var upgrade_options = []
var armor = 0
var speed = 0
var spell_cooldown = 0
var spell_size = 0
var additional_attacks = 0


var icespear_ammo = 0
var icespear_baseammo = 0
var icespear_attackspeed = 1.5
var icespear_level = 0

var enemy_close = []

@onready var sprite = $Sprite2D
@onready var walkTimer = $WalkTimer
@onready var expBar = $ExperienceBar
@onready var lblLevel = $lbl_level
@onready var levelPanel = $LevelUp

  
func upgrade_character(upgrade: String) -> void:
	match upgrade:
		"icespear1":
			icespear_level = 1
			icespear_baseammo += 1
		"icespear2":
			icespear_level = 2
			icespear_baseammo += 1
		"icespear3":
			icespear_level = 3
		"icespear4":
			icespear_level = 4
			icespear_baseammo += 2
