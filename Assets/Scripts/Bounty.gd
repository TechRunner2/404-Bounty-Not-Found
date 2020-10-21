extends KinematicBody2D

enum States{
	EXITING,
	ATTACKING,
	FLEEING,
}

export var speed = 500
export var mass = 10
export var health = 10
export var min_distance = 100
export var flee_threshold = 5
export (States) var state = States.ATTACKING
var velocity = Vector2()

signal Death

func _init():
	velocity = Vector2(rand_range(-1, 1), rand_range(-1,1))

func _physics_process(delta):
	var player_pos = get_node("Player").get_position()
	match state:
		States.EXITING:
			var collisions = move_and_collide(velocity)
			pass
		States.ATTACKING:
			velocity = Steering.turn(velocity, global_position, player_pos, mass, speed)
			look_at(velocity)
			$Laser.shoot(rotation)
			var collisions = move_and_slide(velocity)
			pass
		States.FLEEING:
			var collisions = move_and_collide(velocity)
			pass
	pass

func _process(delta):
	if health <= flee_threshold:
		state = States.FLEEING
		velocity = Vector2(rand_range(-1,1),rand_range(-1,1))
	if state == States.EXITING:
		if scale < Vector2(1,1):
			scale += Vector2(.1, .1) * delta

func take_damage(amount):
	health -= amount
	if health <= 0:
		$Explosion.play()
		emit_signal("Death")
		queue_free()
	
