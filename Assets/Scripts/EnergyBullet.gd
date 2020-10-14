extends KinematicBody2D


export var speed = 600
export var damage = 1
var velocity = Vector2()

func start(pos, dir):
	position = pos
	rotation = dir
	velocity = Vector2(speed, 0).rotated(rotation)
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("take_damage"):
			collision.collider.take_damage(damage)
			queue_free()
		else:
			queue_free()
		
func _on_Timeout_timeout():
	queue_free()
