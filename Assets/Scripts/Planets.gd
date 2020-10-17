extends Node

export (PackedScene) var planet_scene

func generate(pos, dim, quantity):
	for i in range(quantity):
		var new_pos = Vector2(rand_range(pos.x - (dim.x/2), pos.x + (dim.x/2)),
							  rand_range(pos.y - (dim.y/2), pos.y + (dim.y/2)))
		var planet = planet_scene.instance()
		planet.position = new_pos
		add_child(planet)
	pass
