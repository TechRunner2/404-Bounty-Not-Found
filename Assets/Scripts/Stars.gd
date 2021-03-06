extends Node

export var stars = Array()

func generate(pos, dim, quanity):
	#Create New Children
	for i in range(quanity):
		var nx = rand_range(-pos.x-(dim.x/2), pos.x+(dim.x/2))
		var ny = rand_range(-pos.y-(dim.y/2), pos.y+(dim.y/2))
		var rot = rand_range(0, 360)
		var star = stars[int(rand_range(0, stars.size()))]
		var s = star.instance()
		s.position = Vector2(nx, ny)
		s.rotation = rot
		add_child(s)
