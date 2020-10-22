extends Node2D

var menu = preload("res://Assets/Scripts/Main Menu.gd")
var game = preload("res://Assets/Scripts/Game.gd")
var end = preload("res://Scenes/End Screen.tscn")
export var level = 0

var score = 0

func _ready():
	$Music.play()
	

func _process(delta):
	
	pass

func change_level(level):
	var child = get_child(0)
	match level:
		0:
			get_child(0).queue_free()
			add_child(menu)
			pass
		1:
			get_child(0).queue_free()
			add_child(game)
		2:
			get_child(0).queue_free()
			add_child(end)
