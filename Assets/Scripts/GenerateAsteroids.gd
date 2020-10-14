extends Node


export var amount = 5
export var min_scale = 0.5
export var max_scale = 2
export (PackedScene) var Obj


func _ready():
	pass # Replace with function body.

func generate(x,y,width, height):
	for i in range(amount):
		var nx = rand_range(x-(width/2), x+(width/2))
		var ny = rand_range(y-(height/2), y+(height/2))
		var rot = rand_range(0, 360)
		var size = rand_range(min_scale, max_scale)
		var a = Obj.instance()
		a.position = Vector2(nx, ny)
		a.rotation = rot
		a.scale = Vector2(size, size)
		add_child(a)
		
		
