extends Node2D

var current_pos = Vector2()
export (Vector2) var quad_dimension = Vector2(1000, 1000)
var prev_locations = []
var last_star_gen = Vector2()
var menu_open = false

#Quad locations
var top_left = Vector2(-quad_dimension.x, -quad_dimension.y)
var top_center = Vector2(0, -quad_dimension.y)
var top_right = Vector2(quad_dimension.x, -quad_dimension.y)
var center_left = Vector2(-quad_dimension.x, 0)
var center = Vector2(0,0)
var center_right = Vector2(0, quad_dimension.y)
var bottom_left = Vector2(-quad_dimension.x, quad_dimension.y)
var bottom_center = Vector2(0, quad_dimension.y) 
var bottom_right = Vector2(quad_dimension.x, quad_dimension.y)

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
	current_pos += top_center
	var left = current_pos + top_left
	var center = current_pos + top_center
	var right = current_pos + top_right
	if not left in prev_locations:
		generate_quadrant(left)
		prev_locations.append(left)
	if not center in prev_locations:
		generate_quadrant(center)
		prev_locations.append(center)
	if not right in prev_locations:
		generate_quadrant(right)
		prev_locations.append(right)
	pass

func generate_down():
	current_pos += bottom_center
	var left = current_pos + bottom_left
	var center = current_pos + bottom_center
	var right = current_pos + bottom_right
	if not left in prev_locations:
		generate_quadrant(left)
		prev_locations.append(left)
	if not center in prev_locations:
		generate_quadrant(center)
		prev_locations.append(center)
	if not right in prev_locations:
		generate_quadrant(right)
		prev_locations.append(right)
	pass

func generate_left():
	current_pos += center_left
	var top = current_pos + top_left
	var left = current_pos + center_left
	var bottom = current_pos + bottom_left
	if not top in prev_locations:
		generate_quadrant(top)
		prev_locations.append(top)
	if not left in prev_locations:
		generate_quadrant(left)
		prev_locations.append(top)
	if not bottom in prev_locations:
		generate_quadrant(bottom)
		prev_locations.append(bottom)
	pass

func generate_right():
	current_pos += center_right
	var top = current_pos + top_right
	var right = current_pos + center_right
	var bottom = current_pos + bottom_right
	if not top in prev_locations:
		generate_quadrant(top)
		prev_locations.append(top)
	if not right in prev_locations:
		generate_quadrant(right)
		prev_locations.append(right)
	if not bottom in prev_locations:
		generate_quadrant(bottom)
		prev_locations.append(bottom)
	pass

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

	var pos = $Player.position
	#Player Exits Current Quadrant to right
	if pos.x >= current_pos.x + (quad_dimension.x/2):
		print("Gen Right")
		generate_right()
	else: 
		if pos.x <= current_pos.x - (quad_dimension.x/2):
			print("Gen Left")
			generate_left()
	if pos.y >= current_pos.y + (quad_dimension.y/2):
		print("Gen Down")
		generate_down()
	else:
		if pos.y <= current_pos.y - (quad_dimension.y/2):
			print("Gen Up")
			generate_up()
		
	pass

