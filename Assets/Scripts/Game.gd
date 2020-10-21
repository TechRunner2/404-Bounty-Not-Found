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
	$LoadingScreen.visible = true
	get_tree().paused = false
	generate_map(Vector2(0,0))
	$LoadingScreen.visible = false
	get_tree().paused = false
	pass 

func _on_Player_death(dead):
	for child in get_children():
		if child.is_in_group("Projectile"):
			child.queue_free()
	get_tree().change_scene("res://Scenes/End Screen.tscn")
	pass 


func generate_map(pos):
	#Generate Stars
	$Stars.generate(pos, map_size, star_count)
	#Generate Asteroids
	$Asteroids.generate(pos, map_size, asteroid_count)
	#Generate Planets
	$Planets.generate(pos, map_size, planet_count)

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


func _on_Game_visibility_changed():
	
	pass # Replace with function body.
