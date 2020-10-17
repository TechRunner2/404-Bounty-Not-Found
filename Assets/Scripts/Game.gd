extends Node2D

var current_pos = Vector2()
export (Vector2) var map_size = Vector2(50000,50000)
export var asteroid_count = 5
export var star_count = 10
export var planet_count = 50
var prev_locations = []
var last_star_gen = Vector2()
var menu_open = false



func _ready():
	generate_map()
	pass 

func _on_Player_death(dead):
	for child in get_children():
		if child.is_in_group("Projectile"):
			child.queue_free()
	get_tree().change_scene("res://Scenes/End Screen.tscn")
	pass 

func generate_map():
	var map_width = map_size * quad_dimension
	var start_pos = -map_width/2 + quad_dimension
	for y in range(map_size.y):
		var center_y = start_pos.y + (y * quad_dimension.y)
		for x in range(map_size.x):
			var center_x = start_pos.x + (x * quad_dimension.x)
			generate_quadrant(Vector2(center_x, center_y))

func generate_quadrant(pos):
	#Generate Stars
	$Stars.generate(pos, quad_dimension)
	#Generate Asteroids
	$Asteroids.generate(pos, quad_dimension)
	#Generate Planets

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		menu_open != menu_open
		get_tree().paused = menu_open
	pass



func _on_Game_tree_entered():
	#Clear Asteroids
	for asteroid in $Asteroids.get_children():
		asteroid.queue_free()
	#Clear Stars
	for star in $Stars.get_children():
		star.queue_free()
	pass # Replace with function body.
