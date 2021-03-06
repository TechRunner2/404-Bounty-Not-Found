extends Node


export var min_scale = 0.5
export var max_scale = 2
export (PackedScene) var asteroid_scene

func generate(pos, dim, quantity):
	for i in range(quantity):
		var nx = rand_range(-pos.x-(dim.x/2), pos.x+(dim.x/2))
		var ny = rand_range(-pos.y-(dim.y/2), pos.y+(dim.y/2))
		var rot = rand_range(0, 360)
		var size = rand_range(min_scale, max_scale)
		var asteroid = asteroid_scene.instance()
		asteroid.global_position = Vector2(nx, ny)
		asteroid.rotation = rot
		asteroid.scale = Vector2(size, size)
		add_child(asteroid)
		
		
