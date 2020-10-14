extends Node2D



export var quadrant_width = 1000
export var quadrant_height = 1000
var current_quad_location
var prev_locations = []

var menu_open = false


var last_star_gen = Vector2()

enum{
	EXIT_LEFT,
	EXIT_RIGHT,
	EXIT_TOP,
	EXIT_BOTTOM,
	START
}

func _ready():
	current_quad_location = Vector2(0,0)
	generate_quadrants(current_quad_location.x, current_quad_location.y, START)
	pass # Replace with function body.

func _on_Player_death(dead):
	get_tree().change_scene("res://Scenes/End Screen.tscn")
	pass # Replace with function body.

func generate_quadrants(x,y,exit_side):
	match exit_side:
		EXIT_LEFT:
			#Top Left
			generate_quadrant_section(x-quadrant_width, y+quadrant_height)
			#Top Center
			generate_quadrant_section(x-quadrant_width, y)
			#Bottom Left
			generate_quadrant_section(x-quadrant_width, y-quadrant_height)
			#Set new location
			current_quad_location = Vector2(current_quad_location.x - quadrant_width, current_quad_location.y)
		EXIT_TOP:
			#Top Left
			generate_quadrant_section(x-quadrant_width, y+quadrant_height)
			#Top Center
			generate_quadrant_section(x, y+quadrant_height)
			#Top Right
			generate_quadrant_section(x+quadrant_width, y+quadrant_height)
			#Set new location
			current_quad_location = Vector2(current_quad_location.x, current_quad_location.y + quadrant_height)
		EXIT_RIGHT:
			#Top Right
			generate_quadrant_section(x+quadrant_width, y+quadrant_height)
			#Right
			generate_quadrant_section(x+quadrant_width,y)
			#Bottom Right
			generate_quadrant_section(x+quadrant_width, y-quadrant_height)
			current_quad_location = Vector2(current_quad_location.x + quadrant_width, current_quad_location.y)
		EXIT_BOTTOM:
			#Bottom Left
			generate_quadrant_section(x-quadrant_width, y-quadrant_height)
			#Bottom Center
			generate_quadrant_section(x, y-quadrant_height)
			#Bottom Right
			generate_quadrant_section(x+quadrant_width, y-quadrant_height)
			current_quad_location = Vector2(current_quad_location.x, current_quad_location.y - quadrant_height)
		START:
			#Top Left
			generate_quadrant_section(x-quadrant_width, y+quadrant_height)
			#Top Center
			generate_quadrant_section(x, y+quadrant_height)
			#Top Right
			generate_quadrant_section(x+quadrant_width, y+quadrant_height)
			#Left
			generate_quadrant_section(x-quadrant_width, y)
			#Center
			generate_quadrant_section(x, y)
			#Right
			generate_quadrant_section(x+quadrant_width,y)
			#Bottom Left
			generate_quadrant_section(x-quadrant_width, y-quadrant_height)
			#Bottom Center
			generate_quadrant_section(x, y-quadrant_height)
			#Bottom Right
			generate_quadrant_section(x+quadrant_width, y-quadrant_height)
	

func generate_quadrant_section(x,y):
	if not Vector2(x,y) in prev_locations:
		#Generate Stars
		$Stars.generate_stars(x,y,quadrant_width, quadrant_height)
		#Generate Asteroids
		$Asteroids.generate(x,y,quadrant_width, quadrant_height)
		#Generate Planets
		prev_locations.append(Vector2(x,y))

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		menu_open != menu_open
		get_tree().paused = menu_open
		
	var pos = $Player.position
	#Player Exits Current Quadrant to right
	if pos.x >= current_quad_location.x + quadrant_width:
		generate_quadrants(current_quad_location.x + quadrant_width, current_quad_location.y, EXIT_RIGHT)
	#Player Exits quad to left
	if pos.x <= current_quad_location.x - quadrant_width:
		generate_quadrants(current_quad_location.x - quadrant_width, current_quad_location.y, EXIT_LEFT)
		current_quad_location.x = current_quad_location.x - quadrant_width
	#Player Exits quad to up
	if pos.y >= current_quad_location.y + quadrant_height:
		generate_quadrants(current_quad_location.x, current_quad_location.y + quadrant_height, EXIT_TOP)
	#Player Exits to bottom
	if pos.y <= current_quad_location.y - quadrant_height:
		generate_quadrants(current_quad_location.x, current_quad_location.y - quadrant_height, EXIT_BOTTOM)


	pass

