extends Area2D

var level = 1
var hp = 1
var speed = 100
var damage = 5
var knock_amount = 100
var attack_size = 1.0  # Fixed typo

var target = Vector2.ZERO
var angel = Vector2.ZERO

@onready var player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	angel = global_position.direction_to(target)
	rotation = angel.angle() + deg_to_rad(135)
	
	# Initialize properties based on the level
	match level:
		1:
			hp = 1
			speed = 100
			damage = 5
			knock_amount = 100
			attack_size = 1.0

func _physics_process(delta: float) -> void:
	position += angel * speed * delta
	
func enemy_hit(charge: int = 1) -> void:  # Fixed syntax and indentation
	hp -= charge
	if hp <= 0:
		queue_free()
