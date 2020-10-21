extends Node


static func turn(
		velocity:Vector2,
		global_position:Vector2,
		target_position:Vector2,
		mass:float,
		max_speed
	) -> Vector2:
	var new_vel:Vector2
	var target_vel = (target_position - global_position).normalized() * max_speed
	var steering = (target_vel - velocity) / mass
	new_vel += steering
	return new_vel
