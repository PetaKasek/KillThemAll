extends Area2D

@export var level: int = 1
var hp: int = 1
var speed: float = 100.0
var damage: int = 5
var knockback_amount: float = 100.0
var attack_size: float = 1.0

var target: Vector2 = Vector2.ZERO
var angle: Vector2 = Vector2.ZERO

@onready var player: Node
