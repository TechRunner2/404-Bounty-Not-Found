extends Position2D


export (PackedScene) var Projectile
export var shoot_speed:float = 1
var can_shoot = true


func _ready():
	$Timer.wait_time = shoot_speed

func shoot(rot):
	if can_shoot:
		var b = Projectile.instance()
		b.start(global_position, rot)
		get_tree().get_root().add_child(b)
		$FireSound.play()
		can_shoot = false
		$Timer.start()
	pass


func _on_Timer_timeout():
	can_shoot = true
	pass # Replace with function body.
