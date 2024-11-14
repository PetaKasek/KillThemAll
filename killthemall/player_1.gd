extends CharacterBody2D

@export var movement_speed: float = 40.0
var iceSpear = preload("res://ice.tscn")
@onready var Ice  = get_node("%Ice")
@onready var AttackTimer = get_node("%AttackTimer")

var IceSpear_ammo = 0
var Icespear_baseammo = 1
var IceSpear_attackspeed = 1.5
var IceSpear_level = 1

var enemy_close = []
@onready var sprite = $Sprite2D

func _physics_process(delta: float) -> void:
	handle_movement(delta)

func handle_movement(delta: float) -> void:

	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var input_vector = Vector2(x_mov, y_mov)

	if input_vector.x > 0:
		sprite.flip_h = true
	elif input_vector.x < 0:
		sprite.flip_h = false


	velocity = input_vector.normalized() * movement_speed


	move_and_slide()
