extends Position2D


export (PackedScene) var Projectile

func shoot(rot):
	var b = Projectile.instance()
	b.start(global_position, rot)
	get_tree().get_root().add_child(b)
	pass
