extends CharacterBody2D

@export var movement_speed: float = 20.0  

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var sprite = $Sprite2D

func _physics_process(_delta: float) -> void:
	if player:  
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * movement_speed
		move_and_slide()

		
		if direction.x > 0.1:
			sprite.flip_h = true
		elif direction.x < -0.1:
			sprite.flip_h = false
