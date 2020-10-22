extends KinematicBody2D

enum{
	IDLE,
	MOVING,
	BOOSTING,
	SCANING,
	SLOWING
}

var state = IDLE
export var speed = 700
export var boost= 15
export var slowdown = 0.1
var current_speed = 0
export var rotation_speed = 3
export var health = 5
var map_size:Vector2
var can_scan = false


signal death(dead)
signal pos_update(pos)
signal scan_sucessful


func shoot():
	$Laser.shoot(rotation)
	
func take_damage(amount):
	health -= amount
	if health <= 0:
		$DeathSound.play()
		emit_signal("death",true)
	else:
		$HurtSound.play()

func _physics_process(delta):
	var collisions
	match state:
		IDLE: 
			$Sprite/AnimationPlayer.play("Idle")
			pass
		MOVING:
			var direction = Vector2(speed, 0).rotated(rotation)
			current_speed = speed
			collisions = move_and_slide(direction)
			$Sprite/AnimationPlayer.play("Moving")
			pass
		BOOSTING:
			var direction = Vector2(boost, 0).rotated(rotation)
			current_speed = boost
			collisions = move_and_slide(direction)
			$Sprite/AnimationPlayer.play("Moving")
			pass
		SLOWING:
			if current_speed <= 1:
				state = IDLE
			else:
				var new_speed = lerp(current_speed, 0, slowdown)
				var direction = Vector2(new_speed, 0).rotated(rotation)
				current_speed = new_speed
				collisions = move_and_slide(direction)
	emit_signal("pos_update", global_position)
	pass

func _process(delta):
	if Input.is_action_pressed("player_left"):
		rotate(-1 * rotation_speed * delta)
	if Input.is_action_pressed("player_right"):
		rotate(rotation_speed * delta)
	if Input.is_action_just_pressed("player_up"):
		state = MOVING
		if Input.is_action_pressed("player_boost"):
			state = BOOSTING
	if Input.is_action_just_released("player_up"):
		state = SLOWING
	if Input.is_action_pressed("primary_fire"):
		shoot()
	
	pass
