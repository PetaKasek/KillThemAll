extends Node2D  # Use Node2D for movement and spawns

@export var spawns: Array[Spawn_info] = []
@onready var player = get_tree().get_first_node_in_group("player")
var time = 0  # Initialize time
var spawn_interval = 1  # Time interval in seconds between updates (you can adjust this value)

# Called every frame for physics updates
func _physics_process(delta: float) -> void:
	# Increment the time based on the delta (frame time)
	time += delta
	if time >= spawn_interval:  # Check if enough time has passed to increment the timer
		time = 0  # Reset the time after each interval
		_on_timer_timeout()  # Call the spawn logic

# This function handles the enemy spawning logic
func _on_timer_timeout():
	var enemy_spawns = spawns
	for i in enemy_spawns:
		if time >= i.time_start and time <= i.time_end:
			if i.spawn_delay_counter < i.enemy_spawn_delay:
				i.spawn_delay_counter += 1
			else:
				i.spawn_delay_counter = 0
				var new_enemy = i.enemy
				var counter = 0
				while counter < i.enemy_num:
					var enemy_spawn = new_enemy.instantiate()
					enemy_spawn.global_position = get_random_position()
					add_child(enemy_spawn)
					counter += 1
	# Emit the changetime signal with the updated time (optional)
	emit_signal("changetime", time)

# This function calculates random positions for enemy spawning
func get_random_position() -> Vector2:
	var vpr = get_viewport_rect().size * randf_range(1.1, 1.4)

	# Now we only need the corners for spawn positions:
	var spawn_pos1 = Vector2(player.global_position.x - vpr.x / 2, player.global_position.y - vpr.y / 2)
	var spawn_pos2 = Vector2(player.global_position.x + vpr.x / 2, player.global_position.y + vpr.y / 2)

	# Randomly choose a side for spawn positions
	var pos_side = ["up", "down", "right", "left"].pick_random()

	match pos_side:
		"up":
			spawn_pos1 = spawn_pos1
			spawn_pos2 = spawn_pos2
		"down":
			spawn_pos1 = spawn_pos1
			spawn_pos2 = spawn_pos2
		"right":
			spawn_pos1 = spawn_pos1
			spawn_pos2 = spawn_pos2
		"left":
			spawn_pos1 = spawn_pos1
			spawn_pos2 = spawn_pos2

	# Randomize the spawn position within the selected range
	var x_spawn = randf_range(spawn_pos1.x, spawn_pos2.x)
	var y_spawn = randf_range(spawn_pos1.y, spawn_pos2.y)
	return Vector2(x_spawn, y_spawn)
