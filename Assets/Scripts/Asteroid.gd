extends KinematicBody2D

export var health = 10
export var max_speed = 2
export var damage = 2
var direction = Vector2()

func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()

func _ready():
	direction.x = rand_range(-1, 1) * max_speed
	direction.y = rand_range(-1, 1) * max_speed
	pass # Replace with function body.

func _process(delta):
	pass

func _physics_process(delta):
	var collision = move_and_collide(direction)
	if collision:
		if collision.collider.has_method("take_damage"):
			collision.collider.take_damage(damage)
	pass
