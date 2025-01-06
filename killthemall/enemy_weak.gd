extends CharacterBody2D  # Use CharacterBody2D for physics-based movement

@export var movement_speed: float = 20.0

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var sprite = $Sprite2D

func _physics_process(_delta: float) -> void:
	if player:
		# Get the direction vector from the current position to the player
		var direction = global_position.direction_to(player.global_position)
		
		# Set the velocity based on direction and movement speed
		velocity = direction * movement_speed
		
		# Move the character using the built-in velocity
		move_and_slide()

		# Flip the sprite based on movement direction (horizontal)
		if direction.x > 0.1:
			sprite.flip_h = true  # Flip sprite horizontally if moving right
		elif direction.x < -0.1:
			sprite.flip_h = false  # Flip sprite horizontally if moving left
