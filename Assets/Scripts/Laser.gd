extends Position2D


export (PackedScene) var Projectile
var can_shoot = true

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
