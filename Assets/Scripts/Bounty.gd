extends KinematicBody2D

enum{
	IDLE,
	WANDERING,
	ATTACKING,
	FLEEING,
	SELFDESTRUCT
}

export var speed = 500
export var turn_speed = 0.05
export var health = 10
export var wander_area = 200
export var min_distance = 100
var health_threshold = health * .25
var player_pos
var state = ATTACKING
var difficulty = 1
var can_fire = true
var heading = 0
var change_dir = true
export (PackedScene) var weapon

signal Death


func _fixed_process(delta):
	var player_pos = get_node("Player").position
	match state:
		IDLE:
			
			pass

		ATTACKING:
			
			if can_fire == true:
				$Laser.shoot(rotation)
				$Shoot.start()
				can_fire = false
			if position.distance_to(player_pos) > min_distance:
				var direction = Vector2(speed, 0).rotated(rotation)
				var collisions = move_and_slide(direction)
			pass

		FLEEING:
			var dir = Vector2(speed, 0).rotated(rotation)
			var collisions = move_and_slide(dir)
			pass

		SELFDESTRUCT:
			pass

	if health <= health_threshold:
		state = FLEEING
	pass

func _on_Player_pos_update(pos):
	player_pos = pos
	pass # Replace with function body.

func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()
		emit_signal("Death")

func _on_Shoot_timeout():
	can_fire = true
	pass # Replace with function body.


func _on_Wander_timeout():
	change_dir = true
	pass # Replace with function body.
