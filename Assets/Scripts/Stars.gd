extends Node

export var stars = Array()
export var quanity = 20


func generate_stars(x,y, width, height):
	#Create New Children
	for i in range(quanity):
		var nx = rand_range(x-(width/2), x+(width/2))
		var ny = rand_range(y-(height/2), y+(height/2))
		var rot = rand_range(0, 360)
		var location = Vector2(nx, ny)
		var star = stars[int(rand_range(0, stars.size()))]
		var s = star.instance()
		s.position = location
		s.rotation = rot
		add_child(s)
	return Vector2(x,y)
