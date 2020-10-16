extends Node2D

var current_pos = Vector2()
export (Vector2) var quad_dimension = Vector2(1000, 1000)
var prev_locations = []
var last_star_gen = Vector2()
var menu_open = false

#Quad locations
var top_left = Vector2(-quad_dimension.x, -quad_dimension.y) * 2
var top_center = Vector2(0, -quad_dimension.y) * 2
var top_right = Vector2(quad_dimension.x, -quad_dimension.y) *2
var center_left = Vector2(-quad_dimension.x, 0) *2 
var center = Vector2(0,0)
var center_right = Vector2(0, quad_dimension.y) *2 
var bottom_left = Vector2(-quad_dimension.x, quad_dimension.y) * 2
var bottom_center = Vector2(0, quad_dimension.y) * 2 
var bottom_right = Vector2(quad_dimension.x, quad_dimension.y) * 2

func _ready():
	current_pos = Vector2(0,0)
	generate_all()
	pass 

func generate_all():
	generate_quadrant(current_pos)
	generate_up()
	generate_down()
	generate_left()
	generate_right()

func _on_Player_death(dead):
	get_tree().change_scene("res://Scenes/End Screen.tscn")
	pass 

func generate_up():
	var left = Vector2(current_pos.x - quad_dimension.x, current_pos.y - quad_dimension.y)
	var center = Vector2(current_pos.x, current_pos.y - quad_dimension.y)
	var right = Vector2(current_pos.x + quad_dimension.x, current_pos.y - quad_dimension.y)
	generate_quadrant(left)
	generate_quadrant(center)
	generate_quadrant(right)
	current_pos = center
	pass

func generate_down():
	var left = Vector2(current_pos.x - quad_dimension.x, current_pos.y + quad_dimension.y)
	var center = Vector2(current_pos.x, current_pos.y + quad_dimension.y)
	var right = Vector2(current_pos.x + quad_dimension.x, current_pos.y + quad_dimension.y)
	generate_quadrant(left)
	generate_quadrant(center)
	generate_quadrant(right)
	current_pos = center
	pass

func generate_left():
	var new_x = current_pos.x - (quad_dimension.x * 2)
	var top = Vector2(current_pos.x - quad_dimension.x, current_pos.y - quad_dimension.y)
	var left = Vector2(current_pos.x - quad_dimension.x, current_pos.y)
	var bottom = Vector2(current_pos.x - quad_dimension.x, current_pos.y + quad_dimension.y)
	generate_quadrant(top)
	generate_quadrant(left)
	generate_quadrant(bottom)
	current_pos = left
	pass

func generate_right():
	var new_x = current_pos.x + (quad_dimension.x * 2)
	var top = Vector2(new_x, current_pos.y - quad_dimension.y)
	var right = Vector2(new_x, current_pos.y)
	var bottom = Vector2(new_x, current_pos.y + quad_dimension.y)
	generate_quadrant(top)
	generate_quadrant(right)
	generate_quadrant(bottom)
	current_pos = right
	pass

func generate_quadrant(pos):
	if not pos in prev_locations:
		#Generate Stars
		$Stars.generate(pos, quad_dimension)
		#Generate Asteroids
		$Asteroids.generate(pos, quad_dimension)
		#Generate Planets
		#Add position to previous generation locations
		prev_locations.append(pos)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		menu_open != menu_open
		get_tree().paused = menu_open

	var pos = $Player.position
	#Player Exits Current Quadrant to right
	#if pos.x >= current_pos.x + quad_dimension.x:
		#generate_right()
	#Player Exits quad to left
	#if pos.x <= current_pos.x - quad_dimension.x:
		#generate_left()
		
	#Player Exits quad to up
	#if pos.y >= current_pos.y - quad_dimension.y:
		#generate_up()
	#Player Exits to bottom
	#if pos.y <= current_pos.y + quad_dimension.y:
		#generate_down()
	pass

