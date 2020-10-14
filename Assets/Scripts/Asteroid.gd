extends KinematicBody2D

export var health = 5

func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	pass
