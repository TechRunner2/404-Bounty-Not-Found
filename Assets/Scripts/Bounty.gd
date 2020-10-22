extends KinematicBody2D

enum States{
	EXITING,
	ATTACKING,
	FLEEING
}

export var speed = 600
export var mass = 5
export var health = 10
export var min_distance = 100
export var flee_threshold = 5
export (States) var state = States.ATTACKING
var velocity:Vector2 = Vector2()

onready var player = $Player

signal Death

func _ready():
	$Sprite/AnimationPlayer.play("moving")

func _physics_process(delta):
	match state:
		States.ATTACKING:
			move(delta)
		States.FLEEING:
			flee(delta)
	pass

func _process(delta):
	if health < flee_threshold:
		state = States.FLEEING
	match state:
		States.ATTACKING:
			attack()
	pass

func move(delta):
	velocity = Steering.turn(velocity, global_position, player.global_position, mass, speed)
	look_at(global_position + velocity.normalized())
	return move_and_collide(velocity)

func attack():
	var player_dir = (player.global_position - global_position).normalized()
	if player_dir.dot(Vector2.RIGHT.rotated(rotation)) > 0:
		$Laser.shoot(rotation)

func flee(delta):
	var dir = -(player.global_position - global_position)
	velocity = Steering.turn(velocity, global_position, dir, mass, speed)
	return move_and_collide(velocity)

func take_damage(amount):
	health -= amount
	if health <= 0:
		$Explosion.play()
		emit_signal("Death")
		queue_free()

