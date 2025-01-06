extends Area2D

@export var experience: int = 1

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var sound: AudioStreamPlayer = $snd_collected

var spr_green: Texture = preload("res://World/Gem_green.png")
var spr_blue: Texture = preload("res://World/Gem_blue.png")
var spr_red: Texture = preload("res://World/Gem_red.png")

var target: Node2D = null
var speed: float = 0

func _ready() -> void:
	# Nastavení správné textury podle hodnoty experience
	if experience < 5:
		sprite.texture = spr_green
	elif experience < 25:
		sprite.texture = spr_blue
	else:
		sprite.texture = spr_red

func _physics_process(delta: float) -> void:
	# Pohyb směrem k cíli, pokud je target nastaven
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed * delta)
		speed += 2 * delta

func collect() -> int:
	# Spuštění zvuku, deaktivace kolize a skrytí sprite
	sound.play()
	collision.set_deferred("disabled", true)
	sprite.visible = false
	return experience

func _on_snd_collected_finished() -> void:
	# Uvolnění instance, když zvuk dohraje
	queue_free()
