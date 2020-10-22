extends KinematicBody2D

export var mass:float
export var max_speed:float
var velocity:Vector2
export var damage
 

func _physics_process(delta):
	var direction = Steering.turn(velocity, global_position, get_global_mouse_position(), mass, max_speed)
	var collision = move_and_collide(direction)
	if collision:
		var body =  collision.collider
		if body.is_in_group("Bounty"):
			if body.has_method("take_damage"):
				body.take_damage(damage)
		
	pass
