extends Node


export var amount = 5
export var min_scale = 0.5
export var max_scale = 2
export (PackedScene) var Obj

func generate(pos, dim):
	for i in range(amount):
		var nx = rand_range(-pos.x-(dim.x/2), pos.x+(dim.x/2))
		var ny = rand_range(-pos.y-(dim.y/2), pos.y+(dim.y/2))
		var rot = rand_range(0, 360)
		var size = rand_range(min_scale, max_scale)
		var a = Obj.instance()
		a.position = Vector2(nx, ny)
		a.rotation = rot
		a.scale = Vector2(size, size)
		add_child(a)
		
		
